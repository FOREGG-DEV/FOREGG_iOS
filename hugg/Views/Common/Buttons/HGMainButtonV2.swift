import SwiftUI

struct HGMainButtonV2: View {
    let label: String
    var labelFont: Font? = nil
    var labelColor: Color? = nil
    var labelPadding: CGFloat? = nil

    let action: () -> Void

    var body: some View {
        Button(action: self.action) {
            Text(label)
                .font(labelFont ?? .p2)
                .foregroundColor(labelColor ?? .white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, labelPadding ?? 16)
        }
        .background(.main)
        .cornerRadius(4)
    }
}

#Preview {
    ComponentPreviewContainer {
        HGMainButtonV2(label: "Label", action: {})
    }
    .padding()
}
