import KakaoSDKAuth
import KakaoSDKCommon
import SwiftUI

@main
struct huggApp: App {
    @StateObject private var appState = AppState()

    init() {
        // for kakao login
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
                            ManageAccountScreen()
                                .navigationBarBackButtonHidden(true)
                        }

                    })
            }
            .environmentObject(appState)
            .onOpenURL(perform: { url in
                if AuthApi.isKakaoTalkLoginUrl(url) {
                    _ = AuthController.handleOpenUrl(url: url)
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
