//
//  MainButton.swift
//  hugg
//
//  Created by Donghan Kim on 7/7/24.
//

import SwiftUI

struct MainButton: View {
    let label: String
    let labelWeight: Font.Weight? = nil
    let fontSize: CGFloat? = nil
    let verticalPadding: CGFloat? = nil
    let action: () -> Void

    var body: some View {
        Button(action: self.action) {
            Text(label)
                .font(.system(size: fontSize ?? 24, weight: labelWeight ?? .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, verticalPadding ?? 16)
        }
        .background(.main1)
        .cornerRadius(8)
    }
}

#Preview {
    MainButton(label: "메인 버튼",
               action: {
                   print("Hello world")
               })
}
