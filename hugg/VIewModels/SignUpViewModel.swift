import SwiftUI

class SignUpViewModel: ObservableObject {
    init(currentStep: Int = 0, currentSurgeryType: SurgeryType = .THINK_SURGERY,
         currentRound: Int = 0, startDate: Date = Date(),
         ssn: SSNModel = SSNModel(), spouseCode: String = "")
    {
        self.currentStep = currentStep
        self.currentSurgeryType = currentSurgeryType
        self.currentRound = currentRound
        self.startDate = startDate
    }

    // MARK: check current form is valid

    var isCurrentFormValid: Bool {
        switch currentStep {
        case 0:
            // Step 0: 예를 들어 SSN 모델의 값이 유효한지 확인
            return ssn.isValid
        case 1:
            return true
        case 2:
            // Step 2: 라운드 값이 적절히 설정되었는지 확인
            return currentRound > 0
        case 3:
            // Step 3: 배우자 코드가 유효한지 확인
            return !spouseCode.isEmpty
        case 4:
            // Step 4: 기타 필요한 값 확인
            return !fcmToken.isEmpty
        default:
            return false
        }
    }

    // MARK: current Step

    @Published var currentStep: Int = 0

    // MARK: SSN

    @Published var ssn = SSNModel()

    // MARK: surgeryType

    @Published var currentSurgeryType: SurgeryType

    // MARK: count

    @Published var currentRound: Int = 0

    // MARK: startAt

    @Published var startDate: Date

    // MARK: spouseCode

    @Published var spouseCode: String = ""

    // MARK: fcmToken

    @Published var fcmToken: String = ""

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

    func changeSurgeryType(_ newValue: SurgeryType) {
        currentSurgeryType = newValue
    }

    // TODO: Implement Service layer
    // [GET] from Service layer (get spouseCode)
    func changeSpouseCode(_ newValue: String) {
        spouseCode = newValue
    }

    // MARK: FCM Token

    func changeFcmToken(_ newValue: String) {
        fcmToken = newValue
    }

    func signUp() {
        // Check is null?
        // create DTO with ViewModel
//        let signUpDTO = SignUpRequestDTO(
//            surgeryType: currentSurgeryType.rawValue,
//            count: currentRound,
//            startAt: yearMonthDayFormatter.string(from: startDate),
//            spouseCode: spouseCode,
//            ssn: ssn.fullSSN,
//            fcmToken: fcmToken
//        )
    }
}
