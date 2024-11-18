import SwiftUI

struct HGPlusButton: View {
    let onTap: () -> Void
    var size: CGFloat?

    var body: some View {
        Button(action: onTap) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.main)
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .padding(14)
            }
        }
        .frame(width: size ?? 56, height: size ?? 56)
    }
}

#Preview {
    VStack {
        HGPlusButton(onTap: {})
    }
}
