import SwiftUI

@MainActor
class HomeScreenModel: ObservableObject {
    @Published var homeData: HomeResponseDTO?
    @Published var viewStatus: ViewStatus = .loading
    let httpClient = HTTPClient()

    func handleNetworkError(_ error: NetworkError) {
        print(error.localizedDescription)
        switch error {
        case .badRequest:
            self.viewStatus = .failure("잘못된 요청입니다.")
        case .serverError(let message):
            self.viewStatus = .failure("서버 오류: \(message)")
        case .decodingError:
            self.viewStatus = .failure("데이터를 불러오는 데 실패했습니다.")
        case .invalidResponse:
            self.viewStatus = .failure("잘못된 응답을 받았습니다.")
        }
    }

    // [GET] /home
    func fetchDummy() async {
        self.viewStatus = .loading
        do {
            try await Task.sleep(for: .seconds(1))
        } catch let error as NetworkError {
            self.handleNetworkError(error)
        } catch {
            print("Unexpected error: \(error)")
            self.viewStatus = .failure("알 수 없는 오류가 발생했습니다.")
        }
        self.viewStatus = .success
    }

    func fetchHomeData() async {
        self.viewStatus = .loading

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
                self.viewStatus = .success
            } else {
                self.viewStatus = .failure(response.message)
            }

        } catch let error as NetworkError {
            handleNetworkError(error)
        } catch {
            print("Unexpected error: \(error)")
            self.viewStatus = .failure("알 수 없는 오류가 발생했습니다.")
        }
    }
}
