//
// UserResponseDTO.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

struct UserResponseDTO: Codable {
    let keyCode: String?
    let accessToken: String?
    let refreshToken: String?

    init(keyCode: String? = nil, accessToken: String? = nil, refreshToken: String? = nil) {
        self.keyCode = keyCode
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
