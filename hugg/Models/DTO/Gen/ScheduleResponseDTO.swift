//
// ScheduleResponseDTO.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ScheduleResponseDTO: Codable {

    public var records: [RecordResponseDTO]?

    public init(records: [RecordResponseDTO]? = nil) {
        self.records = records
    }


}
