import Foundation

// navigation에 활용하기 위한 Route 정의
enum Route: Hashable {
    case onboarding
    case register
    case mainScreen
    // my page sub screens
    case spouse
    case myMedicine
    case notice
    case faq
    case question
    case terms
    case manageAccount
}

/// 전역적으로 활용되는 State
/// Route 관리
/// 여러 스크린에서 공통적으로 사용되는 회차 정보 등 데이터 저장하기
/// State가 너무 커질 것 같으면 추가적으로 분리해서 활용
class AppState: ObservableObject {
    @Published var testString = "Test for AppState DI"
    // Navigation stack
    @Published var routes: [Route] = []
}
