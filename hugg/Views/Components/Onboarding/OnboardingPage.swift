//
//  OnboardingPage.swift
//  hugg
//
//  Created by Donghan Kim on 7/7/24.
//

import SwiftUI

struct OnboardingPage: View {
    let data: OnBoardingModel

    var body: some View {
        VStack {
            Image(data.image)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 28)
            Text(data.title)
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(.black)
                .padding(EdgeInsets(top: 49, leading: 0, bottom: 8, trailing: 0))
            Text(data.desc)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.black80)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    OnboardingPage(
        data: OnBoardingModel(image: "onboarding1", title: "title", desc: "desc"))
}
