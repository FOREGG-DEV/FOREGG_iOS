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
        OnBoardingModel(image: "onboarding2", title: "여보, 우리 내일부터 과배란 주사지?", desc: "진료 내용, 복약 스케줄, 하루 동안 느낀 감정까지\n모든 과정을 남편과 공유해요."),
        OnBoardingModel(image: "onboarding3", title: "총 얼마 썼는지 궁금할 땐?", desc: "가계부 기능을 통해, 정부지원금과 개인 지출을\n구분하여 확인할 수 있어요."),
        OnBoardingModel(image: "onboarding4", title: "생활습관 챌린지로 건강하게", desc: "난자는 영양 상태, 호르몬 변화에 큰 영향을 받아요.\n챌린지를 통해 건강한 생활습관을 지켜나가요.")
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
