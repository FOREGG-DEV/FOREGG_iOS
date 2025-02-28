//
// MyPageResponseDTO.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

struct MyPageResponseDTO: Codable {
    let _id: Int64?
    let nickname: String?
    let surgeryType: SurgeryType?
    let count: Int?
    let startDate: String?
    let spouse: String?
    let ssn: String?
    let spouseCode: String?

    init(_id: Int64? = nil, nickname: String? = nil, surgeryType: SurgeryType? = nil, count: Int? = nil, startDate: String? = nil, spouse: String? = nil, ssn: String? = nil, spouseCode: String? = nil) {
        self._id = _id
        self.nickname = nickname
        self.surgeryType = surgeryType
        self.count = count
        self.startDate = startDate
        self.spouse = spouse
        self.ssn = ssn
        self.spouseCode = spouseCode
    }

    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case nickname
        case surgeryType
        case count
        case startDate
        case spouse
        case ssn
        case spouseCode
    }
}

extension MyPageResponseDTO {
    static let sample: MyPageResponseDTO =
        .init(_id: 32, nickname: "김허그", surgeryType: SurgeryType.EGG_FREEZING, count: 3, startDate: "2024-01-02", spouse: "배우자", ssn: "9201011", spouseCode: "03FD8")
}
