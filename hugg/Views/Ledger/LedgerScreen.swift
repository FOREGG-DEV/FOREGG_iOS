

import SwiftUI

enum ledgerScreenType: String, Hashable, CaseIterable {
    case all = "전체"
    case byCount = "회차별"
    case byMonth = "월별"
}

struct LedgerScreen: View {
    @State private var selectedTap: String = "전체"
    @State private var currentScreenType: ledgerScreenType = .all

    init() {}

    var body: some View {
        VStack(alignment: .center) {
            Text("가계부")
                .font(.h3)
                .padding(.vertical, 17.0)
            Divider()
            Spacer().frame(height: 16)
            SegmentedView(segments: ["전체", "회차별", "월별"], selected: $selectedTap)
                .padding(.horizontal, 16)

            Spacer()
        }
        .background(.mainBg)
    }
}

#Preview {
    LedgerScreen()
}
