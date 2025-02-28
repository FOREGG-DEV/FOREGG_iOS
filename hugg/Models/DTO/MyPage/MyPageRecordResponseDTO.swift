//
// MyPageRecordResponseDTO.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

struct MyPageRecordResponseDTO: Codable {
    var _id: Int64?
    var date: String?
    var startDate: String?
    var endDate: String?
    var repeatDays: String?
    var name: String?
    var dose: String?

    init(_id: Int64? = nil, date: String? = nil, startDate: String? = nil, endDate: String? = nil, repeatDays: String? = nil, name: String? = nil, dose: String? = nil) {
        self._id = _id
        self.date = date
        self.startDate = startDate
        self.endDate = endDate
        self.repeatDays = repeatDays
        self.name = name
        self.dose = dose
    }

    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case date
        case startDate
        case endDate
        case repeatDays
        case name
        case dose
    }
}
