
import SwiftUI

struct SignUpFooter: View {
    // State DI
    @EnvironmentObject var state: SignUpState
    let onButtonTapped: () -> Void
    var buttonEnable: Bool

    var body: some View {
        VStack {
            if state.isLastStep {
                HGMainButton(label: "가입 완료", action: onButtonTapped)
            } else {
                HGBorderedButton(
                    label: "다음",
                    isEnabled: buttonEnable,
                    action: onButtonTapped
                )

                HStack {
                    Spacer()
                    Text("약관 문의").font(.p2).foregroundStyle(.black70)
                    Spacer().frame(width: 4)
                    Text(customAttributedString)
                    Spacer()
                }
                .padding(.top, 12)
                .opacity(state.currentStep == 0 ? 1 : 0)
            }
        }
        .padding(.bottom, 42)
    }
}

extension SignUpFooter {
    var customAttributedString: AttributedString {
        var string = AttributedString("for.egg0302@gmail.com")
        string.link = URL(string: "mailto:for.egg0302@gmail.com")
        string.font = .p2L
        string.foregroundColor = .black70 // 원하는 색상 지정
        return string
    }
}

#Preview {
    SignUpFooter(onButtonTapped: {}, buttonEnable: true)
        .environmentObject(SignUpState())
}
