//
//  Appbar.swift
//  hugg
//
//  Created by Donghan Kim on 7/4/24.
//

import SwiftUI

struct AppBar: View {
    @Binding var currentStep: Int

    var body: some View {
        HStack {
            if currentStep != 0 {
                Button(action: {
                    // 뒤로가기 액션
                    withAnimation(.default) {
                        if currentStep >= 0 {
                            currentStep -= 1
                        }
                    }
                }) {
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
            Image("onboardingLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 86, height: 26)
            Spacer()
            Button(action: {
                // Skip 버튼 액션
                print("Skip button tapped")
            }) {
                Text("Skip")
                    .fontWeight(Font.Weight.semibold)
                    .foregroundColor(.black60)
            }
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 15)
        .background(Color.white)
        .overlay(VStack {
            Spacer()
            Divider()
                .background(.black60)
                .frame(height: 1)

        })
    }
}

#Preview {
    Group {
        AppBar(currentStep: .constant(0))
        AppBar(currentStep: .constant(1))
    }
}
