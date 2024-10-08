import SwiftUI

private enum AppMode {
    case production
    case signupTest
}

@main
struct huggApp: App {
    private let currentMode: AppMode = .signup

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
