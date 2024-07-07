//
//  MainButton.swift
//  hugg
//
//  Created by Donghan Kim on 7/7/24.
//

import SwiftUI

struct MainButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: self.action) {
            Text(title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
        }
        .background(.main1)
        .cornerRadius(8)
        .padding(.horizontal, 16)
    }
}

#Preview {
    MainButton(title: "메인 버튼",
               action: {
                   print("Hello world")
               })
}
