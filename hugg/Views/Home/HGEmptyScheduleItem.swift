// MARK: Should I have to use device width?

import SwiftUI

struct HGEmptyScheduleItem: View {
    var body: some View {
        Image("emptySchedule")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 285, minHeight: 136)
            .padding(.bottom, 32)
    }
}

#Preview {
    HGEmptyScheduleItem()
}
