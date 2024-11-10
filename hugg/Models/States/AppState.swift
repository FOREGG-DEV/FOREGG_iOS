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

// 전역적으로 활용되는 State
class AppState: ObservableObject {
    @Published var testString = "Test for AppState DI"
    // Navigation stack
    @Published var routes: [Route] = []
}
