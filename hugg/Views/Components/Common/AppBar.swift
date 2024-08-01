//
//  AppBar.swift
//  hugg
//
//  Created by Donghan Kim on 8/1/24.
//

import SwiftUI

struct AppBar: View {
    var title: String

    var body: some View {
        HStack {
            Button(action: {
                // 뒤로가기 액션
            }) {
                Image(systemName: "chevron.left")
                    .fontWeight(.semibold)
                    .foregroundColor(.black60)
                    .frame(width: 24, height: 24)
            }
            Spacer()
            Text(title)
                .font(.pretendartSemiBold16)
            Spacer()
            Spacer()
                .frame(width: 24, height: 24)
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 15)
        .background(.background)
        .overlay(
            VStack {
                Spacer()
                Divider()
                    .background(.black60)
                    .frame(height: 1)

            })
    }
}

#Preview {
    Group {
        Spacer()
        AppBar(title: "회원가입")
        Spacer()
        AppBar(title: "일정")
        Spacer()
    }
}
