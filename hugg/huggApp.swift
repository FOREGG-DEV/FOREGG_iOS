import SwiftUI

// MARK: 앱 테스트 시 활용

private enum AppMode {
    case production
    case signupTest
}

@main
struct huggApp: App {
    private let currentMode: AppMode = .signupTest

    var body: some Scene {
        WindowGroup {
            switch currentMode {
            case .production:
                MainView()
            case .signupTest:
                SignUpScreen()
            }
        }
    }
}
