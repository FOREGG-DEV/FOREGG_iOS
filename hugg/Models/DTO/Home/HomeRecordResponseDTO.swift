import Foundation

enum recordType: String, Codable {
    case MEDICINE
    case INJECTION
    case HOSPITAL
    case ETC
}

struct HomeRecordResponseDTO: Codable {
    let id: Int64
    let recordType: recordType
    let time: String
    let name: String
    let memo: String
    let todo: Bool
}
