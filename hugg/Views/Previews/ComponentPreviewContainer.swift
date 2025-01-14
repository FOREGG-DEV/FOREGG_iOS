import SwiftUI

struct ComponentPreviewContainer<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        VStack {
            Spacer()
            content()
            Spacer()
        }
    }
}

#Preview {
    ComponentPreviewContainer {
        HGTag(label: "hi ui test")
    }
}

