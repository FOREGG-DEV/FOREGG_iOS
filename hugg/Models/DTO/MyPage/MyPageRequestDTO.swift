//
// MyPageRequestDTO.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

struct MyPageRequestDTO: Codable {
    var surgeryType: SurgeryType?
    var count: Int?
    var startDate: String?

    init(surgeryType: SurgeryType? = nil, count: Int? = nil, startDate: String? = nil) {
        self.surgeryType = surgeryType
        self.count = count
        self.startDate = startDate
    }
}
