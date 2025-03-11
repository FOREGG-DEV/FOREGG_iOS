import SwiftUI

@MainActor
class SignUpModel: ObservableObject {
    // initializer with default values
    init(
        currentStep: Int = 0,
        currentSurgeryType: SurgeryType = .THINK_SURGERY,
        currentRound: Int = 0,
        startDate: Date = Date(),
        ssn: SSNModel = SSNModel(),
        spouseCode: String = ""
    ) {
        self.currentStep = currentStep
        self.currentSurgeryType = currentSurgeryType
        self.currentRound = currentRound
        self.startDate = startDate
    }
    
    @Published var termsAgree: Bool = false
    @Published var privacyAgree: Bool = false
    @Published var ageCheckAgree: Bool = false
    let client = LoginHTTPClient()
    
    // MARK: check current form is valid
    
    var isCurrentFormValid: Bool {
        switch currentStep {
        case 0:
            return true
        case 1:
            // Step 0: 예를 들어 SSN 모델의 값이 유효한지 확인
            return ssn.isValid
        case 2:
            return true
        case 3:
            // Step 2: 라운드 값이 적절히 설정되었는지 확인
            return currentRound > 0
        case 4:
            return true
        case 5:
            return !spouseCode.isEmpty
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
        currentStep == 5
    }
    
    var toString: String {
        "###State###\n SSN: \(ssn)\n SurgeryType: \(currentSurgeryType)\n Round: \(currentRound)\n StartDate: \(startDate)\n SpouseCode: \(spouseCode)"
    }
}

// MARK: - SignUp Logics

extension SignUpModel {
    func increaseStep() {
        withAnimation(.default) {
            if currentStep < 6 {
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
    func populateSpouseCode() async {
        // create resource
        let resource = Resource(url: Constants.Urls.spouseCode, method: .get([]), modelType: ApiResponse<UserSpouseCodeResponseDTO>.self)
        
        do {
            let response = try await client.load(resource, token: nil)
            if response.isSuccess, let data = response.data {
                changeSpouseCode(data.spouseCode)
                print(spouseCode)
            }
        } catch let NetworkError.serverError(error as ApiResponse<UserSpouseCodeResponseDTO>) {
            print(error.code)
            print(error.message)
            // show error popup
        } catch {
            print(error.localizedDescription)
        }
    }
    
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
