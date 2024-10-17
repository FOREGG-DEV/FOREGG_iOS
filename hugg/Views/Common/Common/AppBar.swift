//
//  AppBar.swift
//  hugg
//
//  Created by Donghan Kim on 8/1/24.
//

import SwiftUI

struct AppBar: View {
    var title: String
    var onBack: () -> Void

    var body: some View {
        HStack {
            Button(action: onBack) {
                Image(systemName: "chevron.left")
                    .fontWeight(.semibold)
                    .foregroundColor(.black60)
                    .frame(width: 24, height: 24)
            }
            Spacer()
            Text(title)
                .font(.pretendardSemiBold16)
                .foregroundStyle(.kBlack)
            Spacer()
            Spacer()
                .frame(width: 24, height: 24)
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 15)
        .background(.mainBg)
        .overlay(
            VStack {
                Spacer()
                Divider()
                    .background(.black60)
                    .frame(height: 1)

            })
    }
}

// AppBar without Back button
struct AppBarWithoutBtn: View {
    var title: String

    var body: some View {
        HStack {
            Spacer()
            Text(title)
                .font(.pretendardSemiBold16)
                .foregroundStyle(.kBlack)
            Spacer()
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 15)
        .background(.mainBg)
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
        AppBar(title: "회원가입", onBack: {})
        Spacer()
        AppBar(title: "일정", onBack: {})
        Spacer()
        AppBarWithoutBtn(title: "마이페이지")
        Spacer()
    }
}
