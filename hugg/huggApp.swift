import SwiftUI

// MARK: 앱 테스트 시 활용

private enum AppMode {
    case production
    case signupTest
    case mainScreenTest
}

@main
struct huggApp: App {
    private let currentMode: AppMode = .mainScreenTest

    var body: some Scene {
        WindowGroup {
            switch currentMode {
            case .production:
                MainView()
            case .signupTest:
                SignUpScreen()
            case .mainScreenTest:
                MainScreen()
            }
        }
    }
}
