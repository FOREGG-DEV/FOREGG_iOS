import Foundation

struct LoginHTTPClient {
    func load<T: Codable>(_ resource: Resource<T>, token: String) async throws -> ApiResponse<T> {
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

        // HTTP 요청 설정
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json", "accessToken": token]
        let session = URLSession(configuration: configuration)

        // 비동기 요청 수행
        let (data, response) = try await session.data(for: request)

        // 응답 타입 확인
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        // HTTP 상태 코드 검사 (2xx 성공)
        guard (200 ... 299).contains(httpResponse.statusCode) else {
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
