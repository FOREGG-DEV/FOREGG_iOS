import SwiftUI

// TODO: Tapview 적용 with SegmentedView

struct LedgerScreen: View {
    // Tap
    private let tapOption: [String] = ["전체", "회차별", "월별"]
    @State private var selectedTap: String = "전체"

    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Text("가계부")
                    .font(.h3)
                    .padding(.vertical, 17.0)
                Divider()
                Spacer().frame(height: 16)
                SegmentedView(segments: tapOption, selected: $selectedTap)
                    .padding(.horizontal, 16)

                Spacer()
            }
            .background(.mainBg)
            HGPlusButton(onTap: {})
        }
    }
}

#Preview {
    LedgerScreen()
}

