
import SwiftUI

/// Item for Home Schedule (Not Empty)
struct HGHomeScheduleItem: View {
    var body: some View {
        RoundedRectangle(cornerRadius: Constants.CornerRadius.six)
            .inset(by: 1)
            .fill(.white)
            .stroke(Constants.Colors.main)
            .frame(minWidth: 285, maxHeight: 136)
            .overlay {
                VStack {
                    HStack {
                        HGTag(label: "병원", background: Constants.Colors.calendarHospital)

                        Spacer()

                        HGArrowRight(color: Constants.Colors.main)
                    }
                }
                .padding(12)
            }
    }
}

#Preview {
    VStack {
        HGHomeScheduleItem()
        Spacer()
    }
    .padding()
}
