import SwiftUI

/// appState DI 적용을 위한 Container
/// Preview 사용 시 appState와 같은 environment object가 필요한 경우 이 컨테이너를 사용합니다.
/// 적용된 objects : AppState
struct PreviewContainer<Content: View>: View {
    @StateObject private var appState = AppState()
    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        content()
            .environmentObject(appState)
    }
}

#Preview {
    PreviewContainer {
        TestView()
    }
}

// PreviewContainer test view
struct TestView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        Text(appState.testString)
    }
}
