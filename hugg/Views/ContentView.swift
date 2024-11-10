import SwiftUI

struct EntryPointScreen: View {
    @EnvironmentObject private var appState: AppState

    func checkUserAndProceed() async {
        try? await Task.sleep(for: .seconds(1))

        let userToken = UserDefaults.standard.string(forKey: "userToken")
        if userToken != nil {
            appState.routes.append(.mainScreen)
        } else {
//            appState.routes.append(.onboarding)
            appState.routes.append(.mainScreen)
        }
    }

    var body: some View {
        ZStack {
            SplashScreen()
                .onAppear {
                    Task {
                        await checkUserAndProceed()
                    }
                    // check userToken
                    // if user token exist -> app state append mainscreen route
                    // else -> app state append onboarding route
                }
        }
    }
}

#Preview {
    PreviewContainer {
        EntryPointScreen()
    }
}
