//
//  AppBar.swift
//  hugg
//
//  Created by Donghan Kim on 8/1/24.
//

import SwiftUI

struct HGAppBar: View {
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
struct HGAppBarWithoutBack: View {
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

struct HGAppBarWithTrailing<Trailing: View>: View {
    var title: String
    var onBack: () -> Void
    @ViewBuilder let trailing: Trailing

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

            trailing
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

#Preview {
    VStack {
        HGAppBar(title: "회원가입", onBack: {})
        Spacer()
        
        HGAppBarWithTrailing(title: "test", onBack: {}) {
            Text("Trailing")
        }
        
        Spacer()
    }
}
