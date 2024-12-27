//
//  BorderedButton.swift
//  hugg
//
//  Created by Donghan Kim on 7/7/24.
//

import SwiftUI

struct HGBorderedButton: View {
    let label: String
    let isEnabled: Bool
    let action: () -> Void

    var body: some View {
        if isEnabled {
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
        } else {
            Button(action: self.action) {
                Text(label)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black30)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
            }
            .background(.disabledBg)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(.disabledBorder, lineWidth: 1))
            .disabled(true)
        }
    }
}

#Preview {
    VStack {
        HGBorderedButton(label: "다음",
                         isEnabled: true,
                         action: {
                             print("heoo")
                         })

        Spacer().frame(height: 20)

        HGBorderedButton(label: "다음",
                         isEnabled: false,
                         action: {
                             print("heoo")
                         })
    }
    .padding()
}
