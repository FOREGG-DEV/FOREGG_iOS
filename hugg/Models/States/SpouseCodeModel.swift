import Foundation

@MainActor
class SpouseCodeModel: ObservableObject {
    let client = HTTPClient()

    @Published private(set) var spouseCode: String? = nil

    func fetchSpouseCode() async throws {
        let resource = try Resource(
            url: Constants.Urls.spouseCode,
            method: HTTPMethod.get([]),
            modelType: ApiResponse<UserSpouseCodeResponseDTO>.self
        )

        let spouseCodeResponse = try await client.load(resource)
        print(spouseCodeResponse)
        spouseCode = spouseCodeResponse.data?.spouseCode
    }
}
