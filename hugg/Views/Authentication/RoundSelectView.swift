import SwiftUI

struct RoundSelectView: View {
    @EnvironmentObject var state: SignUpState

    var body: some View {
        VStack(alignment: .leading) {
            SignUpTitleText(title: "현재 진행중인 회차를\n알려주세요")
            Counter(cnt: $state.currentRound)

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
    RoundSelectView()
        .environmentObject(SignUpState())
}
