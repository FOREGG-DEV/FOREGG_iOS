//
//  AlertPopup.swift
//  hugg
//
//  Created by Donghan Kim on 11/17/24.
//

import SwiftUI

struct AlertPopup: View {
    let onConfirm: () -> Void
    let title: String
    var btnLabel: String = "확인"
    var btnBackgroundColor: Color = .main

    var body: some View {
        VStack(alignment: .center) {
            Text(title)
                .font(.h2)
            Spacer()
                .frame(height: 24)
            Button(action: onConfirm) {
                Text(btnLabel)
                    .font(.h2)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .background(btnBackgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: Constants.CornerRadius.button))
            }
        }
        .padding(.horizontal, 16.0)
        .padding(.top, 40.0)
        .padding(.bottom, 32.0)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: Constants.CornerRadius.button))
        .padding(.horizontal, 16.0)
    }
}

#Preview {
    VStack {
        Spacer()
        AlertPopup(onConfirm: {}, title: "Preview Check")
        Spacer()
    }
    .background(Constants.Colors.backgroundMain)
}
