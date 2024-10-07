import SwiftUI

struct RoundSelectPage: View {
    @EnvironmentObject var vm: SignUpViewModel

    var body: some View {
        VStack {
            SignUpTitleText(title: "현재 진행중인 회차를\n알려주세요")
            Counter(cnt: $vm.currentRound)
        }
    }
}

#Preview {
    RoundSelectPage()
        .environmentObject(SignUpViewModel())
}
