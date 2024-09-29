//
//  SignupView.swift
//  hugg
//
//  Created by Donghan Kim on 8/1/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var vm = SignUpViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            // TODO: change onBack logic (maybe navigation)
            AppBar(title: "회원가입", onBack: vm.decreaseStep)
                .padding(.bottom, 38)

            Group {
                HStack {
                    ForEach(0 ..< 3, id: \.self) { index in
                        Rectangle()
                            .frame(width: index == vm.currentStep ? 20 : 10, height: 10)
                            .foregroundColor(index == vm.currentStep ? .mainSub : .black30)
                            .cornerRadius(5)
                    }
                }
                .background(RoundedRectangle(cornerRadius: 30).fill(Color.clear))
                .allowsTightening(false)

                // MARK: Sign Up Content below

                switch vm.currentStep {
                case 0:
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

                case 1:
                    TreatmentSelectView()

                default:
                    Spacer()
                }
                Spacer()

                // MARK: Change Button if it is last content

                if vm.isLastStep {
                    MainButton(label: "가입 완료", action: {})
                } else {
                    BorderedButton(label: "다음", action: {
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
}

// SignUpState
