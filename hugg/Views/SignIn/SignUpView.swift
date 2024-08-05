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

    var body: some View {
        // TODO: Signup Content
        // TODO: Design State
        VStack(alignment: .leading) {
            AppBar(title: "회원가입")
            Spacer()
                .frame(height: 38)
            Group {
                SkeletonBox(label: "idc", width: 44, height: 10)

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
        .background(.bg)
    }
}

#Preview {
    SignUpView()
}

// SignUpState

