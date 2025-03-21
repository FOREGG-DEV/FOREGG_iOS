//
// SideEffectResponseDTO.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct SideEffectResponseDTO: Codable {

    public var _id: Int64?
    public var date: String?
    public var content: String?

    public init(_id: Int64? = nil, date: String? = nil, content: String? = nil) {
        self._id = _id
        self.date = date
        self.content = content
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case date
        case content
    }

}
