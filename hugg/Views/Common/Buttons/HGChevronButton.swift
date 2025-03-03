
import SwiftUI

enum ChevronButtonType {
    case left
    case right
}

struct HGChevronButton: View {
    let buttonType: ChevronButtonType
    let enable: Bool
    var size: CGFloat? = 20

    let action: () -> Void

    private var iconName: String {
        switch self.buttonType {
        case .left:
            "chevron.left"
        case .right:
            "chevron.right"
        }
    }

    var body: some View {
        Image(systemName: self.iconName)
            .resizable()
            .scaledToFit()
            .foregroundStyle(self.enable ? Constants.Colors.black60 : Constants.Colors.black20)
            .frame(width: self.size, height: self.size)
            .onTapGesture {
                self.action()
            }
    }
}

#Preview {
    HGChevronButton(buttonType: .left, enable: true) {}
}
