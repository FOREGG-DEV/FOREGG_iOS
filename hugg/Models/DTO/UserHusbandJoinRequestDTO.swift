import Foundation

struct UserHusbandJoinRequestDTO: Codable {
    let spouseCode: String
    let ssn: String
    let fcmToken: String
}
