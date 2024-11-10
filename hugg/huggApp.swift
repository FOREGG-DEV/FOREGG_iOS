import KakaoSDKAuth
import KakaoSDKCommon
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

    init() {
        KakaoSDK.initSDK(appKey: "e211712190fce0293656d10fdd460b4d")
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appState.routes) {
                EntryPointScreen()
                    .navigationBarBackButtonHidden(true)
                    .navigationDestination(for: Route.self, destination: { route in
                        switch route {
                        case .onboarding:
                            OnboardingScreen()
                                .navigationBarBackButtonHidden(true)

                        case .register:
                            SignUpScreen()
                                .navigationBarBackButtonHidden(true)

                        case .mainScreen:
                            MainScreen()
                                .navigationBarBackButtonHidden(true)
                        // MyPage derivation
                        case .spouse:
                            DummyScreen()

                        case .myMedicine:
                            DummyScreen()

                        case .faq:
                            DummyScreen()

                        case .notice:
                            DummyScreen()

                        case .question:
                            DummyScreen()

                        case .terms:
                            DummyScreen()

                        case .manageAccount:
                            DummyScreen()
                        }

                    })
            }
            .environmentObject(appState)
            .onOpenURL(perform: { url in
                if AuthApi.isKakaoTalkLoginUrl(url) {
                    AuthController.handleOpenUrl(url: url)
                }
            })
        }
    }
}

struct DummyScreen: View {
    var body: some View {
        Text("Hello, World!")
    }
}
