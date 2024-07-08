//
//  BorderedButton.swift
//  hugg
//
//  Created by Donghan Kim on 7/7/24.
//

import SwiftUI

struct BorderedButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: self.action) {
            Text(title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
        }
        .background(.white)
        .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(.main1, lineWidth: 1))
        .padding(.horizontal, 16)
    }
}

#Preview {
    BorderedButton(title: "다음",
                   action: {
                       print("heoo")
                   })
}
