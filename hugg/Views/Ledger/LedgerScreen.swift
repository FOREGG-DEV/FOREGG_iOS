import SwiftUI

// TODO: Tapview 적용 with SegmentedView

enum LedgerAllFilter {
    case all
    case personal
    case support
}

struct LedgerScreen: View {
    // Tap
    private let tapOption: [String] = ["전체", "회차별", "월별"]

    @State private var selectedTap: String = "전체"
    @State private var currentIndex: Int = 0
    @EnvironmentObject private var appState: AppState

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
                .padding(.horizontal, 16)

                TabView(selection: $currentIndex) {
                    ForEach(0 ..< tapOption.count, id: \.self) { idx in
                        if idx == 0 {
                            // MARK: all

                            LedgerAllPage()
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

            HGPlusButton(onTap: {
                appState.routes.append(.ledgerForm)
            })
            .padding([.trailing, .bottom], 16)
        }
    }
}

#Preview {
    PreviewContainer {
        LedgerScreen()
    }
}
