import Foundation
// 회원가입 시 사용하는 DTO

struct SignUpRequestDTO: Codable {
    let surgeryType: String
    let count: Int
    let startAt: String
    let spouseCode: String
    let ssn: String
    let fcmToken: String
}
