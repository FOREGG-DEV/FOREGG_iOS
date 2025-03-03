import SwiftUI

// subsidy popup config
// get appState toast here

// LedgerModel
// MyPageModel - 유저 기본 정보임

struct SubsidyScreen: View {
    @EnvironmentObject private var appState: AppState
    var body: some View {
        VStack {
            HGAppBar(title: "지원금", onBack: {
                _ = appState.routes.popLast()

            })
            ScrollView {
                VStack {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

extension SubsidyScreen {
    func populateSubsidies() async {}
    
}

#Preview {
    PreviewContainer {
        SubsidyScreen()
    }
}

/*
TODO: SubsidyScreen Implementation
 - [ ] UI
 - [ ] UI
 - [ ] UI
*/
