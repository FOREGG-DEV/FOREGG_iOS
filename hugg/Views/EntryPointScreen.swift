import SwiftUI

/// The entry point view for the app, responsible for determining the user's starting route.
///
/// This screen checks if the user is logged in by verifying the presence of a `userToken`
/// in `UserDefaults`. Based on this, the app navigates either to the main screen
/// or the onboarding/register screen.
///
/// - Requires: An `AppState` instance must be provided via the `@EnvironmentObject` property wrapper.
struct EntryPointScreen: View {
    @EnvironmentObject private var appState: AppState

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

extension EntryPointScreen {
    /// Checks if the user is authenticated and determines the initial route.
    ///
    /// This method checks for a `userToken` in `UserDefaults`:
    /// - If the token exists, it appends the `.mainScreen` route to the app state.
    /// - If the token does not exist, it appends the `.register` route to the app state.
    ///
    /// - Note: This method introduces a delay of 1 second to simulate an asynchronous operation,
    /// which could represent an API call or a token validation process.
    func checkUserAndProceed() async {
        try? await Task.sleep(for: .seconds(1))

        let userToken = UserDefaults.standard.string(forKey: "userToken")

        if userToken != nil {
            // maybe we have to get extra datas here?
            print("go to main screen")
            appState.routes.append(.mainScreen)
        } else {
            appState.routes.append(.onboarding)
        }
        
        // 권한 허용 되었는지도 확인하기 ?
    }
}

#Preview {
    PreviewContainer {
        EntryPointScreen()
    }
}
