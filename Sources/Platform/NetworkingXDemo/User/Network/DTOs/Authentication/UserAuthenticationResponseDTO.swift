//
//  File.swift
//  
//
//   Created by Poshan Karki on 8/30/21.
//

import Foundation
import NetworkingXDemo_Domain

struct UserAuthenticationResponseDTO: Codable {

    let token: Token1
    let refreshToken, tokenType: String
    let regcomplete, emailverified, phoneverified: Bool
    
    enum CodingKeys: String, CodingKey {
        case token, refreshToken
        case tokenType = "token_type"
        case regcomplete, emailverified, phoneverified
    }
}

// MARK: - Token
struct Token1: Codable {
    let validTo, value: String
}
