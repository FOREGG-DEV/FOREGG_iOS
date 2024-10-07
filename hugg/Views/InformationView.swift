//
//  InformationView.swift
//  hugg
//
//  Created by Donghan Kim on 7/19/24.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        VStack {
            MainAppBar()
            Text("정보 탭")
            Spacer()
        }
    }
}

#Preview {
    InformationView()
}

struct MainAppBar: View {
    var hasBackBtn: Bool = false
    var title: String = "정보"

    var body: some View {
        HStack {
            if hasBackBtn {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .fontWeight(Font.Weight.semibold)
                        .foregroundColor(.black60)
                        .frame(width: 24, height: 24)
                }
            } else {
                Spacer()
                    .frame(width: 24, height: 24)
            }

            Spacer()

            Text(title)

            Spacer()
                .frame(width: 24, height: 24)
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 17)
        .background(.white)
        .overlay(VStack {
            Spacer()
            Divider()
                .background(.black60)
                .frame(height: 1)

        })
    }
}
