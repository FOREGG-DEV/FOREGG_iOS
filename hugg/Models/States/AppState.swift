import Foundation

enum AppMode {
    case debug, product
}

// navigation에 활용하기 위한 Route 정의
enum Route: Hashable {
    case onboarding
    case register
    case mainScreen
    // my page sub screens
    case spouse
    case myMedicine
    case question
    case manageAccount
    case notification
}

enum BottomNavigationTab: Hashable {
    case home, calendar, daily, ledger, mypage
}

/// 전역적으로 활용되는 State
/// Route 관리
/// 여러 스크린에서 공통적으로 사용되는 회차 정보 등 데이터 저장하기
/// State가 너무 커질 것 같으면 추가적으로 분리해서 활용
class AppState: ObservableObject {
    @Published var testString = "Test for AppState DI"
    /// enum for checking current app mode
    /// if it is debug mode, using test account's kakao oauth token
    @Published var appMode: AppMode = .debug
    // Navigation stack
    @Published var routes: [Route] = []
    @Published var currentBottomNavTab: BottomNavigationTab = .home

    func initState() {
        routes = []
    }
}

extension AppState {
    // Bottom Navigation
    func changeBottomNavigationTab(_ newVal: BottomNavigationTab) {
        currentBottomNavTab = newVal
    }
}
