import Foundation

// enum for network error
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

struct Resource<T: Decodable> {
    let url: URL
    let method: HTTPMethod = .get([])
    let modelType: T.Type
}

struct HTTPClient {
    func load<T: Codable>(_ resource: Resource<T>) async throws -> T {
        var request = URLRequest(url: resource.url)

        switch resource.method {
        case .get(let queryItems):
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems

            guard let url = components?.url else {
                throw NetworkError.badRequest
            }

            // set url with query params
            request = URLRequest(url: url)

        case .post(let data):
            request.httpMethod = resource.method.name
            request.httpBody = data

        case .delete:
            request.httpMethod = resource.method.name

        case .put(let data):
            request.httpMethod = resource.method.name
            request.httpBody = data
        }

        if let jwtToken = TokenManager.shared.jwtToken {
            request.addValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        }

        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        let session = URLSession(configuration: configuration)

        let (data, response) = try await session.data(for: request)

        // get response
        guard let _ = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        // Decode JSON to resource's model type
        guard let result = try? JSONDecoder().decode(resource.modelType, from: data) else {
            throw NetworkError.decodingError
        }

        return result
    }
}
