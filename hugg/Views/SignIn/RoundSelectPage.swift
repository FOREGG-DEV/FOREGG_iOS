import SwiftUI

struct RoundSelectPage: View {
    @EnvironmentObject var vm: SignUpViewModel

    var body: some View {
        VStack(alignment: .leading) {
            SignUpTitleText(title: "현재 진행중인 회차를\n알려주세요")
            Counter(cnt: $vm.currentRound)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    RoundSelectPage()
        .environmentObject(SignUpViewModel())
}
