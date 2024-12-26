import SwiftUI

// TODO: Tapview 적용 with SegmentedView

struct LedgerScreen: View {
    // Tap
    private let tapOption: [String] = ["전체", "회차별", "월별"]
    @State private var selectedTap: String = "전체"
    @State private var currentIndex: Int = 0

    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Text("가계부")
                    .font(.h3)
                    .padding(.vertical, 17.0)
                Divider()
                Spacer().frame(height: 16)
                // Binding 생성 (Int -> String)
                // newValue -> from get?
                SegmentedView(
                    segments: tapOption,
                    selected: Binding(
                        get: { tapOption[currentIndex] },
                        set: { newValue in
                            if let newIndex = tapOption.firstIndex(of: newValue) {
                                currentIndex = newIndex
                            }
                        }
                    )
                )

                TabView(selection: $currentIndex) {
                    ForEach(0 ..< tapOption.count, id: \.self) { idx in
                        VStack {
                            Text("페이지 \(idx)")
                        }
                        .background(.yellow)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .background(.mainBg)
            HGPlusButton(onTap: {})
        }
    }
}

#Preview {
    LedgerScreen()
}
