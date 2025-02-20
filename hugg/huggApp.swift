import KakaoSDKAuth
import KakaoSDKCommon
import SwiftUI

@main
struct huggApp: App {
    @StateObject private var appState = AppState()
    @StateObject private var myPageModel = MyPageModel()

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
                            MyPageSpouseScreen()
                                .navigationBarBackButtonHidden(true)

                        case .myMedicine:
                            DummyScreen()

                        case .question:
                            MyPageQuestionScreen()
                                .navigationBarBackButtonHidden(true)

                        case .manageAccount:
                            ManageAccountScreen()
                                .navigationBarBackButtonHidden(true)
                        }

                    })
            }
            .environmentObject(appState)
            .environmentObject(myPageModel)
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

// TODO: environmentObject에 인스턴스를 바로 주입하면 어떤 문제가 생기나?
