//
//  BorderedButton.swift
//  hugg
//
//  Created by Donghan Kim on 7/7/24.
//

import SwiftUI

struct BorderedButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: self.action) {
            Text("다음")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black) // Change text color
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
        }
        .background(.white)
        .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(.main1, lineWidth: 1))
        .padding(.horizontal, 16)
    }
}

#Preview {
    BorderedButton(action: {
        print("heoo")
    })
}
