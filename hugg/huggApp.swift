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
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                switch currentMode {
                case .production:
                    MainView()
                case .signupTest:
                    SignUpScreen()
                case .mainScreenTest:
                    MainScreen()
                }
            }
            .environmentObject(appState)
        }
    }
}
