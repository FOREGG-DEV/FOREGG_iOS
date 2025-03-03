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
    case dailyHug
    case dailyHugList
    case ledgerForm
    case subsidy
    case subsidyForm
}

enum BottomNavigationTab: Hashable {
    case home, calendar, daily, ledger, mypage
}

/// 전역적으로 활용되는 State
/// Route 관리
/// 여러 스크린에서 공통적으로 사용되는 회차 정보 등 데이터 저장하기
/// State가 너무 커질 것 같으면 추가적으로 분리해서 활용
class AppState: ObservableObject {
    /// enum for checking current app mode
    /// if it is debug mode, using test account's kakao oauth token
    @Published var appMode: AppMode = .debug
    // Navigation stack
    @Published var routes: [Route] = []
    @Published var currentBottomNavTab: BottomNavigationTab = .home
    /// 전역으로 관리되는 toast message
    /// navigation 처리 이후 표시되는 toast를 관리할 때 사용합니다.
    /// 해당 값을 초기화하는 것은 각 View에 종속적입니다.
    @Published var toastMessage: String? = nil

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
