import SwiftUI

// TODO: Tapview 적용 with SegmentedView

struct LedgerScreen: View {
    // Tap
    private let tapOption: [String] = ["전체", "회차별", "월별"]
    @State private var selectedTap: String = "전체"
    @State private var currentIndex: Int = 0

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .center) {
                Text("가계부")
                    .font(.h3)
                    .padding(.vertical, 17)
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
                        if idx == 0 {
                            // MARK: all

                            VStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.white)
                                    .frame(width: .infinity, height: 171)
                                    .overlay {
                                        VStack {
                                            HStack {
                                                Text("2024. 07. 17 - 2024. 08. 25")
                                                    .font(.h4)
                                                    .foregroundStyle(Constants.Colors.black70)
                                                Spacer()
                                                Image("tune")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 24, height: 24)
                                            }
                                            Spacer()
                                        }.padding(12)
                                    }

                                Spacer()
                                    .frame(height: 12)

                                Spacer()
                            }

                        } else if idx == 1 {
                            // MARK: round

                            VStack {
                                Text("회차 Fragment")
                            }

                        } else {
                            // MARK: monthly

                            VStack {
                                Text("월별 Fragment")
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .background(.mainBg)

            // MARK: Floating Button

            HGPlusButton(onTap: {})
                .padding([.trailing, .bottom], 16)
        }
    }
}

#Preview {
    LedgerScreen()
}

struct HGCalendarTag: View {
    let color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 3)
            .inset(by: 3)
            .fill(color)
            .frame(width: 12, height: 12)
    }
}
