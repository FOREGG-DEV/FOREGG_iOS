import Foundation

// codable -> JSON parsing
struct MyPageResponseDTO: Codable {
    let id: Int
    // 닉네임
    let nickname: String
    // 시술 정보
    let surgeryType: SurgeryType
    // 회차
    let count: Int
    // start date -> notion 참조
    let startDate: String
    let spouse: String
    // 주민번호
    let ssn: String
    // 배우자코드
    let spouseCode: String
}

extension MyPageResponseDTO {
    static let sample: MyPageResponseDTO =
        .init(id: 32, nickname: "김동한", surgeryType: SurgeryType.EGG_FREEZING, count: 3, startDate: "2024-01-02", spouse: "정선호", ssn: "9704251", spouseCode: "03FD8")
}
