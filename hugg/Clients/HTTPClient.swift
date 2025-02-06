import Foundation

// enum for network error
// TODO: serverError인 경우 에러 코드 처리는 어떻게 해야하나?
enum NetworkError: Error {
    case badRequest
    case serverError(String)
    case decodingError
    case invalidResponse
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badRequest:
            // comment -> 추가적인 정보 제공 (개발 과정에서 활용)
            return NSLocalizedString("Unable to perform request", comment: "badRequestError")
        case .serverError(let errorMessage):
            print(errorMessage)
            return NSLocalizedString(errorMessage, comment: "serverError")

        case .decodingError:
            return NSLocalizedString("Unable to decode successfully.", comment: "decodingError")

        case .invalidResponse:
            return NSLocalizedString("Invalid response", comment: "invalidResponse")
        }
    }
}

enum HTTPMethod {
    case get([URLQueryItem])
    case post(Data?)
    case delete
    case put(Data?)

    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        case .put:
            return "PUT"
        }
    }
}

struct Resource<T: Codable> {
    let url: URL
    var method: HTTPMethod = .get([])
    var modelType: T.Type
}

struct HTTPClient {
    func load<T: Codable>(_ resource: Resource<T>) async throws -> T {
        var request = URLRequest(url: resource.url)

        // HTTP 메서드 설정
        switch resource.method {
        case .get(let queryItems):
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
            if !queryItems.isEmpty {
                components?.queryItems = queryItems
            }
            guard let url = components?.url else {
                throw NetworkError.badRequest
            }
            request = URLRequest(url: url)

        case .post(let data), .put(let data):
            request.httpMethod = resource.method.name
            request.httpBody = data

        case .delete:
            request.httpMethod = resource.method.name
        }

        // JWT 토큰 추가
        if let jwtToken = TokenManager.shared.jwtToken {
            request.addValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        }

        // HTTP 요청 설정
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        let session = URLSession(configuration: configuration)

        // 비동기 요청 수행
        let (data, response) = try await session.data(for: request)

        // 응답 타입 확인
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        // HTTP 상태 코드 검사 (2xx 성공)
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError("Server returned status code: \(httpResponse.statusCode)")
        }

        // JSON 디코딩
        do {
            let result = try JSONDecoder().decode(resource.modelType, from: data)
            return result
        } catch {
            print("Decoding error: \(error.localizedDescription)")
            throw NetworkError.decodingError
        }
    }
}
