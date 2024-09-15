//
//  SignupView.swift
//  hugg
//
//  Created by Donghan Kim on 8/1/24.
//

import SwiftUI

struct SignUpView: View {
    @State var progressIndex: Int = 0

    func increaseIndex() {
        withAnimation {
            progressIndex += 1
        }
    }

    func decreaseIndex() {
        withAnimation {
            progressIndex -= 1
        }
    }

    var body: some View {
        // TODO: Signup Content
        // TODO: Design State
        VStack(alignment: .leading) {
            AppBar(title: "회원가입", onBack: decreaseIndex)
            Spacer()
                .frame(height: 38)

            // MARK: custom progress indicator

            Group {
                HStack {
                    ForEach(0 ..< 3, id: \.self) { index in
                        Rectangle()
                            .frame(width: index == progressIndex ? 20 : 10, height: 10)
                            .foregroundColor(index == progressIndex ? .main : .black30)
                            .cornerRadius(5)
                    }
                }
                .background(RoundedRectangle(cornerRadius: 30).fill(Color.clear))
                .frame(width: 44)
                .allowsTightening(false)

                // MARK: Sign Up Content below

                Text("주민번호 앞 7자리를 \n적어주세요")
                    .font(.pretendardSemiBold24)
                    .foregroundStyle(.black80)
                    .padding(.bottom, 12)
                SkeletonBox(width: .infinity, height: 48)
                Spacer()

                // MARK: Change Button if it is last content

                if progressIndex == 4 {
                    MainButton(label: "가입 완료", action: {})
                } else {
                    BorderedButton(label: "다음", action: {
                        increaseIndex()
                    })
                }
                ViewThatFits(in: .vertical) {
                    Spacer()
                        .frame(maxHeight: 40)
                }
            }
            .padding(.horizontal, 16)
        }
        .background(.mainBg)
    }
}

#Preview {
    SignUpView()
}

// SignUpState
