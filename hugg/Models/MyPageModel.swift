import SwiftUI

enum MyPageError: Error {
    case errorTest
}

// TODO: async throws로 변경
@MainActor
class MyPageModel: ObservableObject {
    @Published var myPage: MyPageResponseDTO?
    //    @Published var medicalInfos
    //    @Published var FAQs = []
    //    @Published var boards = []

    // DI : Client
    let httpClient = HTTPClient()

    // logics
    // 순서)
    // 1: isLoading -> true
    // 2: API 콜
    // 3: error 발생 시 -> errorMessage != nil
    // 4: data 변경
    // 5: isLoading -> false

    /// [GET]  /myPage : 내 정보 보기 API
    func populateMyPage() async throws {
        // MOCK
        try await Task.sleep(for: .seconds(3))
        myPage = MyPageResponseDTO.sample
    }

    /// [GET] /myPage/medicalInfo : 내 주사, 약 기록 보기 API
    func populateMedicalInfo() {}

    /// [GET] /myPage/boards : 공지사항 보기 API
    func populateBoards() {}

    /// [GET] /myPage/boardSearchBy : 공지사항 검색 API
    /// query : 검색어
    /// boards에 담기
    func populateBoardsBySearch(_ query: String) {}

    /// [GET] /myPage/FAQs : FAQ 보기 API
    func populateMyPageFAQ() {}

    /// [GET] /myPage/FAQs : FAQ 보기 API
    /// query : 검색어
    /// faq 리스트 값 변경
    func populateMyPageFAQBySearch(_ query: String) {}

    /// [PUT] /myPage/modifySurgery : 시술 정보 수정 API
    func modifySurgery() {}
}
