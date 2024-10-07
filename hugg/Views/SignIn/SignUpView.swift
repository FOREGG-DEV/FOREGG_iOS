import SwiftUI

struct SignUpView: View {
    @StateObject private var vm = SignUpViewModel()

    @State private var isBack: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            // TODO: change onBack logic (maybe navigation)
            AppBar(title: "회원가입", onBack: {
                if !isBack {
                    isBack.toggle()
                }
                vm.decreaseStep()
            })
            .padding(.bottom, 38)

            Group {
                HStack {
                    Rectangle()
                        .frame(width: vm.currentStep == 0 ? 20 : 10, height: 10)
                        .foregroundColor(.mainSub)
                        .cornerRadius(5)
                    Rectangle()
                        .frame(width: vm.currentStep >= 1 && vm.currentStep < 4 ? 20 : 10, height: 10)
                        .foregroundColor(vm.currentStep >= 1 ? .mainSub : .black30)
                        .cornerRadius(5)
                    Rectangle()
                        .frame(width: vm.currentStep == 4 ? 20 : 10, height: 10)
                        .foregroundColor(vm.currentStep == 4 ? .mainSub : .black30)
                        .cornerRadius(5)
                }
                .background(RoundedRectangle(cornerRadius: 30).fill(Color.clear))
                .allowsTightening(false)

                // MARK: Sign Up Content below

                Group {
                    switch vm.currentStep {
                    // TODO: conditional jump -> husband, wife version (depending on user's gender)
                    case 0:
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading) {
                                Text("주민번호")
                                    .font(.pretendardSemiBold24)
                                    .foregroundStyle(.black80) +
                                    Text(" 앞 7자리").font(.pretendardSemiBold24).foregroundStyle(.main) + Text("를\n적어주세요.")
                                    .font(.pretendardSemiBold24)
                                    .foregroundStyle(.black80)
                            }
                            .padding(.bottom, 12)

                            SkeletonBox(width: .infinity, height: 48)
                        }
                        .frame(maxWidth: .infinity)
                    case 1:
                        TreatmentSelectView()
                    case 2:
                        RoundSelectPage()
                    case 3:
                        TreatmentStartDatePage()
                    case 4:
                        ShareCodePage()

                    default:
                        Spacer().frame(height: 10)
                    }
                }
                .transition(isBack ? .backTransition : .nextTransition)

                Spacer()

                // MARK: Change Button if it is last content

                if vm.isLastStep {
                    MainButton(label: "가입 완료", action: {})
                } else {
                    BorderedButton(label: "다음", action: {
                        if isBack {
                            isBack.toggle()
                        }
                        vm.increaseStep()
                    })
                }

                // MARK: Check wtf ?

                ViewThatFits(in: .vertical) {
                    Spacer()
                        .frame(maxHeight: 40)
                }
            }
            .padding(.horizontal, 16)
        }
        .background(.mainBg)
        // DI
        .environmentObject(vm)
    }
}

#Preview {
    SignUpView()
        .environmentObject(SignUpViewModel())
}

// SignUpState
