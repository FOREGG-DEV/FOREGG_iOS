//
//  SignUpViewModel.swift
//  hugg
//
//  Created by Donghan Kim on 8/6/24.
//

import SwiftUI

// Swift Enum
// status.rawValue => String 사용 가능
enum TreatmentStatus: String, CaseIterable, Identifiable {
    case consideringTreatment = "시술 고민 중"
    case intrauterineInsemination = "인공수정(자궁 내 정자 주입술)"
    case eggFreezing = "난자 동결"
    case inVitroFertilization = "체외 수정(시험관 아기)"
    var id: TreatmentStatus { self }
}

class SignUpViewModel: ObservableObject {
    init(currentStep: Int = 0, currentTreatmentStatus: TreatmentStatus = .consideringTreatment, currentRound: Int = 0, startDate: Date = Date()) {
        self.currentStep = currentStep
        self.currentTreatmentStatus = currentTreatmentStatus
        self.currentRound = currentRound
        self.startDate = startDate
    }

    // 회원가입 단계 index
    @Published var currentStep: Int = 0

    var isLastStep: Bool {
        currentStep == 4
    }

    func increaseStep() {
        withAnimation(.default) {
            if currentStep < 4 {
                currentStep += 1
            }
        }
    }

    func decreaseStep() {
        withAnimation(.default) {
            if currentStep >= 1 {
                currentStep -= 1
            }
            // else -> Navigation?
        }
    }

    // View array 사용하는 게 일반적인 방법인가?
    // 공통 부분
//    @Published var titles: [any View] = [
//        Text("주민번호 앞 7자리를\n적어주세요."),
//        Text("현재 받고 있는 시술을\n선택해주세요."),
//        Text("현재 진행중인 회차를\n알려주세요."),
//        Text("치료 시작 날짜를\n알려주세요."),
//        Text("배우자 코드를 남편에게\n공유해주세요."),
//    ]

    // Sign up params
    @Published var currentTreatmentStatus: TreatmentStatus = .consideringTreatment

    func changeTreatmentStatus(_ newValue: TreatmentStatus) {
        currentTreatmentStatus = newValue
    }

    @Published var currentRound: Int = 0
    @Published var startDate: Date
}
