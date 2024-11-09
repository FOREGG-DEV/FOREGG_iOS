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
            NavigationStack(path: $appState.routes) {
                EntryPointScreen()
                    .navigationDestination(for: Route.self, destination: { route in
                        switch route {
                        case .onboarding:
                            OnboardingScreen()
                        case .register:
                            SignUpScreen()
                        case .mainScreen:
                            MainScreen()
                        }
                    })
            }
            .navigationBarBackButtonHidden()
            .environmentObject(appState)
        }
    }
}
