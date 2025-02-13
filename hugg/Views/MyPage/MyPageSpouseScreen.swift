import SwiftUI

struct MyPageSpouseScreen: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            AppBar(title: "배우자", onBack: {
                _ = appState.routes.popLast()
            })

            HStack {
                Text("배우자 공유코드")
                // 좌로 정렬
                Spacer()
            }
            .padding(.horizontal, 16.0)

            Spacer()
        }
        .background(Constants.Colors.backgroundMain)
    }
}

#Preview {
    PreviewContainer {
        MyPageSpouseScreen()
    }
}
