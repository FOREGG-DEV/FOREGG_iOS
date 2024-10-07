import SwiftUI

// MARK: Date 포맷팅하기 사용법 체크 및 정리

// TODO: DatePicker 색깔 커스텀하기

// var dateFormatter: DateFormatter {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "yyyy-MM-dd"
//    return formatter
// }

struct SelectStartDateView: View {
    @EnvironmentObject var vm: SignUpViewModel

    var body: some View {
        VStack(alignment: .leading) {
            SignUpTitleText(title: "치료 시작 날짜를 알려주세요")
            HStack(spacing: 0) {
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 8.0, bottomLeading: 8.0, bottomTrailing: 0.0, topTrailing: 0.0))
                        .fill(.main)
                        .frame(width: 48, height: 48)
                    Image(systemName: "calendar")
                        .foregroundStyle(.white)
                        .frame(width: 20, height: 20)
                }
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0.0, bottomLeading: 0.0, bottomTrailing: 8.0, topTrailing: 8.0))
                        .fill(.white)

                    Text("\(vm.startDate, formatter: yearMonthDayFormatter)")
                        .font(.h3)
                }
                .frame(width: 128, height: 48)
            }
            .overlay {
                DatePicker("", selection: $vm.startDate, displayedComponents: .date)
                    .labelsHidden()
                    .colorMultiply(.clear)
            }
        }
    }
}

#Preview {
    ZStack {
        Color(.mainBg)
        SelectStartDateView()
            .padding(.horizontal, 16)
    }
    .environmentObject(SignUpViewModel())
}
