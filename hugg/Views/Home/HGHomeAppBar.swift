//
//  HGHomeAppBar.swift
//  hugg
//
//  Created by Donghan Kim on 2/28/25.
//

import SwiftUI

struct HGHomeAppBar: View {
    @EnvironmentObject private var appState: AppState
    var body: some View {
        HStack {
            Image("logo")
                .fontWeight(.semibold)
                .foregroundColor(.black60)
                .frame(width: 28, height: 30)

            Spacer()

            Button(action: {
                self.appState.routes.append(.notification)
            }) {
                Image(systemName: "bell.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
                    .foregroundStyle(.black50)
            }
        }
        .padding(.horizontal, 28)
        .padding(.bottom, 16)
        .background(.mainBg)
        .overlay(
            VStack {
                Spacer()
                Divider()
                    .background(.black10)
                    .frame(height: 1)

            })
        .padding(.bottom, 25)
    }
}

#Preview {
    PreviewContainer {
        VStack {
            Spacer()
            HGHomeAppBar()
            Spacer()
        }
    }
}
