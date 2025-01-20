// TODO: Check AttributedString
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
                        RoundSelectView()
                    case 4:
                        SelectStartDateView()
                    case 5:
                        WifeShareCodeView()

                    default:
                        Spacer().frame(height: 10)
                    }
                }
                .transition(isBack ? .backTransition : .nextTransition)

                // MARK: Change Button if it is last content

//                if vm.isLastStep {
//                    HGMainButton(label: "가입 완료", action: {})
//                } else {
//                    HGBorderedButton(label: "다음",
//                                     isEnabled: vm.isCurrentFormValid,
//                                     action: {
//                                         print(vm.isCurrentFormValid)
//                                         if isBack {
//                                             isBack.toggle()
//                                         }
//                                         vm.increaseStep()
//                                     })
//
//                    HStack {
//                        Spacer()
//                        Text("약관 문의").font(.p2).foregroundStyle(.black70)
//                        Spacer().frame(width: 4)
//                        Text(customAttributedString)
//                        Spacer()
//                    }
//                    .padding(.top, 12)
//                    .opacity(vm.currentStep == 0 ? 1 : 0)
//                }
//
//                Spacer()
//                    .frame(maxHeight: 40)
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
