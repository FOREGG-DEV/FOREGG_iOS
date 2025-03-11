import Foundation

// enum for network error
// TODO: serverError인 경우 에러 코드 처리는 어떻게 해야하나?
enum NetworkError: Error {
    case badRequest
    case serverError(Any)
    case decodingError
    case invalidResponse
}

// Codable한 Any struct
struct AnyCodable: Codable {}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badRequest:
            // comment -> 추가적인 정보 제공 (개발 과정에서 활용)
            return NSLocalizedString("Unable to perform request", comment: "badRequestError")
        case .serverError(let error as ApiResponse<AnyCodable>):
            return NSLocalizedString(error.message, comment: "serverError")

        case .decodingError:
            return NSLocalizedString("Unable to decode successfully.", comment: "decodingError")

        case .invalidResponse:
            return NSLocalizedString("Invalid response", comment: "invalidResponse")
        case .serverError:
            return NSLocalizedString("unexpected Error", comment: "serverError")
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
    var modelType: ApiResponse<T>.Type
}

struct HTTPClient {
    func load<T: Codable>(_ resource: Resource<T>) async throws -> ApiResponse<T> {
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

        do {
            let result = try JSONDecoder().decode(resource.modelType, from: data)
            // ✅ 서버 응답이 실패인 경우 (isSuccess = false)
            if !result.isSuccess {
                throw NetworkError.serverError(result)
            }

            return result

        } catch let error as DecodingError {
            throw NetworkError.decodingError
        } catch {
            throw error
        }
    }
}
