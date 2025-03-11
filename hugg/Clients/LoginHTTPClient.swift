import Foundation

struct LoginHTTPClient {
    func load<T: Codable>(_ resource: Resource<T>, token: String?) async throws -> ApiResponse<T> {
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

        // ✅ 헤더에 accessToken 추가
        let configuration = URLSessionConfiguration.default
        if token != nil {
            configuration.httpAdditionalHeaders = ["Content-Type": "application/json", "accessToken": token!]
        } else {
            configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        }
        let session = URLSession(configuration: configuration)

        // 비동기 요청 수행
        let (data, response) = try await session.data(for: request)

        // ✅ 응답 타입 확인
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        // ✅ JSON 디코딩 시도
        do {
            let result = try JSONDecoder().decode(resource.modelType, from: data)
            print(result)
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
