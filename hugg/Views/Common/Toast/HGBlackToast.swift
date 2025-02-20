
import SwiftUI

struct HGBlackToast: View {
    let label: String

    var body: some View {
        HStack {
            Spacer()
            Text(label)
                .font(.p2)
                .foregroundStyle(Color.white)
                .padding(10.0)
            Spacer()
        }
        .background(Constants.Colors.backgroundDim)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal, 16.0)
    }
}

#Preview {
    VStack {
        Spacer()
        HGBlackToast(label: "클립보드에 배우자 코드가 복사되었어요!")
        Spacer()
    }
    .background(Constants.Colors.backgroundMain)
}
