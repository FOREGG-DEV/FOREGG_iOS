import SwiftUI

struct TreatmentSelectView: View {
    @EnvironmentObject var state: SignUpState

    @State private var showDropbox: Bool = false

    func selectTreatment(_ newValue: SurgeryType) {
        state.changeSurgeryType(newValue)
        withAnimation {
            showDropbox.toggle()
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            SignUpTitleText(title: "현재 받고 있는 시술을\n선택해주세요.")

            Button(action: {
                withAnimation(.default) {
                    showDropbox.toggle()
                }
            }, label: {
                HStack(spacing: 0) {
                    ZStack {
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 8.0, bottomLeading: 8.0, bottomTrailing: 0.0, topTrailing: 0.0))
                            .fill(.white)
                        Text(state.currentSurgeryType.rawValue)
                    }
                    .frame(height: 48.0)

                    ZStack {
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0.0, bottomLeading: 0.0, bottomTrailing: 8.0, topTrailing: 8.0))
                            .fill(.main)
                            .frame(width: 48.0, height: 48.0)
                        Image(systemName: showDropbox ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.white)
                    }
                    .frame(width: 48.0, height: 48.0)
                }
            })
            .buttonStyle(NoTapAnimationStyle())

            ZStack {
                Rectangle()
                    .foregroundStyle(.clear)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 6, y: 4
                    )

                VStack(spacing: 0) {
                    ForEach(SurgeryType.allCases, id: \.self) { item in
                        ZStack {
                            Rectangle()
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.clear)
                                .background(state.currentSurgeryType == item ? .mainBg : .white)
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8)))
                            Text(item.rawValue)
                                .font(.pretendardSemiBold16)
                                .foregroundStyle(.black70)
                                .padding(.vertical, 13.0)
                        }
                        .onTapGesture {
                            selectTreatment(item)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 192)
            .opacity(showDropbox ? 1.0 : 0.0)
            .zIndex(100)

            Spacer()

            SignUpFooter(
                onButtonTapped: {
                    state.increaseStep()
                },
                buttonEnable: true
            )
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TreatmentSelectView()
        .background(.mainBg)
        .padding(.horizontal, 16.0)
        .environmentObject(SignUpState())
}
