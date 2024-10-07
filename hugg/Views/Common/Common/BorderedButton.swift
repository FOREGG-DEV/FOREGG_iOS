//
//  BorderedButton.swift
//  hugg
//
//  Created by Donghan Kim on 7/7/24.
//

import SwiftUI

struct BorderedButton: View {
    let label: String
    let action: () -> Void

    var body: some View {
        Button(action: self.action) {
            Text(label)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
        }
        .background(.white)
        .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(.main, lineWidth: 1))
    }
}

#Preview {
    BorderedButton(label: "다음",
                   action: {
                       print("heoo")
                   })
}
