//
//  ErrorPopup.swift
//  hugg
//
//  Created by Donghan Kim on 3/3/25.
//

import SwiftUI

struct ErrorPopup: View {
    let onConfirm: () -> Void

    var body: some View {
        VStack(alignment: .center) {
            Text("문제가 발생했어요")
                .font(.h2)
                .foregroundStyle(Constants.Colors.black)
                .padding(.top, 8)
                .padding(.bottom, 2)

            Text("네트워크 연결상태를 확인 후 다시 시도해주세요")
                .font(.p1L)
                .foregroundStyle(Constants.Colors.black50)
                .padding(.bottom, 22)

            Button(action: onConfirm) {
                Text("확인")
                    .font(.h2)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
            }
            .background(Constants.Colors.main)
            .clipShape(RoundedRectangle(cornerRadius: Constants.CornerRadius.button))
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 32)
    }
}

#Preview {
    VStack {
        Spacer()
        ErrorPopup(onConfirm: {})
        Spacer()
    }
    .background(Constants.Colors.backgroundMain)
}
