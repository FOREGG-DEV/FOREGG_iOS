import SwiftUI

@MainActor
class HomeScreenModel: ObservableObject {
    @Published var homeData: HomeResponseDTO?
    let httpClient = HTTPClient()

    func handleNetworkError(_ error: NetworkError) {
        print(error.localizedDescription)
    }

    // [GET] /home
    func fetchDummy() async throws {
        do {
            try await Task.sleep(for: .seconds(1))
        } catch {
            print("Unexpected error: \(error)")
            throw error
        }
    }

    func fetchHomeData() async {
        do {
            // create resource for api call
            let resource = Resource<HomeResponseDTO>(
                url: URL(string: "http://ec2-15-164-204-24.ap-northeast-2.compute.amazonaws.com:8080/home")!,
                method: .get([]),
                modelType: ApiResponse<HomeResponseDTO>.self // ✅ ApiResponse<T> 사용
            )

            let response = try await httpClient.load(resource)

            if response.isSuccess {
                self.homeData = response.data
                // if data.ssn -> male => change appState gender to Male
            } else {
                self.homeData = nil
            }

        } catch let error as NetworkError {
            handleNetworkError(error)
        } catch {
            print("Unexpected error: \(error)")
        }
    }
}
