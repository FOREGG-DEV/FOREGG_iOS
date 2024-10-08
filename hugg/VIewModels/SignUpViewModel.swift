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

    // MARK: current Step

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

    @Published var ssn = SSNModel()

    // MARK: surgeryType

    @Published var currentSurgeryType: SurgeryType

    func changeSurgeryType(_ newValue: SurgeryType) {
        currentSurgeryType = newValue
    }

    // MARK: count

    @Published var currentRound: Int = 0

    // MARK: startAt

    @Published var startDate: Date

    // MARK: spouseCode

    @Published var spouseCode: String = ""
    // TODO: Implement Service layer
    // [GET] from Service layer (get spouseCode)
    func changeSpouseCode(_ newValue: String) {
        spouseCode = newValue
    }

    // MARK: SSN

    // MARK: FCM Token

    @Published var fcmToken: String = ""
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
