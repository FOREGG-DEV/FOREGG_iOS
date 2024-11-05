import SwiftUI

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
