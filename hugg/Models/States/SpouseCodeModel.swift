import Foundation

@MainActor
class SpouseCodeModel: ObservableObject {
    let client = HTTPClient()

    @Published private(set) var spouseCode: String? = nil

    func fetchSpouseCode() async throws {
        // create resource
        let resource = Resource(
            url: Constants.Urls.spouseCode,
            method: HTTPMethod.get([]),
            modelType: ApiResponse<UserSpouseCodeResponseDTO>.self
        )

        let spouseCodeResponse = try await client.load(resource)
        // 프린트 말고 디버깅 방법이 있을까?
        print(spouseCodeResponse)
        spouseCode = spouseCodeResponse.data?.spouseCode
    }
}
