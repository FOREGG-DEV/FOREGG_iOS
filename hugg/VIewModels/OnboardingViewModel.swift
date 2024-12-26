//
//  OnboardingViewModel.swift
//  hugg
//
//  Created by Donghan Kim on 7/19/24.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var datas: [OnBoardingModel] = [
        OnBoardingModel(image: "onboarding1", title: "주사맞을 시간엔 알람이 울려요", desc: "정확한 시간에 맞아야 하는 주사,\n허그가 챙길 테니 안심하세요."),
        OnBoardingModel(image: "onboarding2", title: "여보, 오늘 하루 힘들었지?", desc: "하루 동안 느낀 감정을 기록하고\n남편과 공유해보세요."),
        OnBoardingModel(image: "onboarding5", title: "우리 내일 병원 가는 날이지?", desc: "하루 동안 느낀 감정을 기록하고\n남편과 공유해보세요."),
        OnBoardingModel(image: "onboarding3", title: "지원금, 얼마 썼는지 궁금할 땐?", desc: "가계부 기능을 통해, 정부지원금과 개인 지출을\n구분하여 확인할 수 있어요."),
        OnBoardingModel(image: "onboarding4", title: "함께하는 챌린지로 건강하게", desc: "임신에 큰 영향을 주는 영양 상태와 호르몬 변화,\n챌린지를 통해 건강한 생활습관 지켜나가요.")
    ]

    @Published var currentStep: Int = 0

    func increaseStep() {
        withAnimation(.default) {
            if currentStep < datas.count - 1 {
                currentStep += 1
            }
        }
    }

    func decreaseStep() {
        withAnimation(.default) {
            if currentStep >= 1 {
                currentStep -= 1
            }
        }
    }
}
