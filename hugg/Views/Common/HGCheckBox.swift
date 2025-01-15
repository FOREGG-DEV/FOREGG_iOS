import SwiftUI

/// Checkbox Component built with static icon images
///
/// It is static Component
struct HGCheckBox: View {
    var isOn: Bool

    var body: some View {
        Image(systemName: isOn ? "checkmark.square" : "square")
            .resizable()
            .scaledToFit()
            .frame(width: 16, height: 16)
            .foregroundStyle(Constants.Colors.black50)
    }
}

#Preview {
    ComponentPreviewContainer {
        HGCheckBox(isOn: true)
    }
}
