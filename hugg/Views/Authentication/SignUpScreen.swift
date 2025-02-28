// TODO: Check AttributedString
// TODO: - AppBar도 각 View마다 따로 처리하는 것이 더 맞는 것 같음
import SwiftUI

struct SignUpScreen: View {
    @StateObject private var state = SignUpState()

    @State private var isBack: Bool = false

    // for custom Link

    var body: some View {
        VStack(alignment: .leading) {
            // TODO: change onBack logic (maybe navigation)
            AppBar(title: "회원가입", onBack: {
                if !isBack {
                    isBack.toggle()
                }
                state.decreaseStep()

                isBack.toggle()
            })
            .padding(.bottom, 38)

            Group {
                HStack {
                    Rectangle()
                        .frame(width: state.currentStep == 0 ? 20 : 10, height: 10)
                        .foregroundColor(.mainSub)
                        .cornerRadius(5)
                    Rectangle()
                        .frame(width: state.currentStep >= 1 && state.currentStep < 5 ? 20 : 10, height: 10)
                        .foregroundColor(state.currentStep >= 1 ? .mainSub : .black30)
                        .cornerRadius(5)
                    Rectangle()
                        .frame(width: state.currentStep == 5 ? 20 : 10, height: 10)
                        .foregroundColor(state.currentStep == 5 ? .mainSub : .black30)
                        .cornerRadius(5)
                }
                .background(RoundedRectangle(cornerRadius: 30).fill(Color.clear))
                .allowsTightening(false)

                // MARK: Sign Up Content below

                Group {
                    switch state.currentStep {
                    // TODO: conditional jump -> husband, wife version (depending on user's gender)
                    case 0:
                        AgreementView()
                    case 1:
                        EnterSSNView()
                    case 2:
                        TreatmentSelectView()
                    case 3:
                        CountSelectView()
                    case 4:
                        SelectStartDateView()
                    case 5:
                        WifeShareCodeView()

                    default:
                        Spacer().frame(height: 10)
                    }
                }
                .transition(isBack ? .backTransition : .nextTransition)
            }
            .padding(.horizontal, 16)
        }
        .background(.mainBg)
        // DI
        .environmentObject(state)
    }
}

#Preview {
    SignUpScreen()
}

// SignUpState
