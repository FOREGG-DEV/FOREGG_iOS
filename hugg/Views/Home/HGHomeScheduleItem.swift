import SwiftUI

/// Item for Home Schedule (Not Empty)
struct HGHomeScheduleItem: View {
    var borderFocused: Bool = true
    var hasMemo: Bool = false

    var body: some View {
        RoundedRectangle(cornerRadius: Constants.CornerRadius.six)
            .inset(by: 1)
            .fill(.white)
            .stroke(borderFocused ? Constants.Colors.main : Color.white)
            .frame(minWidth: 285, maxHeight: 136)
            .overlay {
                VStack {
                    HStack {
                        HGTag(label: "병원", background: Constants.Colors.calendarHospital)

                        Spacer()

                        HGArrowRight(color: Constants.Colors.main)
                    }

                    HStack(alignment: .center) {
                        HGCheckBox(isOn: false)
                        Text("13:00")
                            .font(.h1)
                            .foregroundStyle(Constants.Colors.black90)
                        Spacer()
                    }

                    Spacer()
                        .frame(height: 5)

                    HStack {
                        Text("의료법인 마리아의료재단")
                            .font(.p2)
                            .foregroundStyle(Constants.Colors.black80)
                        Spacer()
                    }

                    Spacer()
                        .frame(height: 8)

                    // MARK: 약 / 병원 따라 분기 1회

                    if hasMemo {
                        Text("메모가 들어가는 자리입니다. 메모가 없으면 비워두는 게 나을 것 같아요 넘치면 점 세개로 들어가야해요 더 길어지면 어떻게 될까요? 굼금하다")
                            .font(.p3L)
                            .foregroundStyle(Constants.Colors.black70)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                    } else {
                        // MARK: Add MainButton Tap event => Finish Todo

                        HGMainButtonV2(label: "진료 내용 기록하기", labelPadding: 5.0, action: {})
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
    .background(Constants.Colors.backgroundMain)
    .padding()
}
