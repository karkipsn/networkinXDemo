//
//  File.swift
//  
//
//  Created by Poshan Karki on 8/30/21.
//

import Foundation
import NetworkingXDemo_Domain

struct UserCredentialUDS: Codable {
   
    let accessToken: String
    let tokenType: String
    let expiresIn: String
    let refreshToken: String
  
}

extension UserCredentialUDS {
    init(credential: UserAccessCredential) {
    
        self.accessToken = credential.accessToken
        self.tokenType = credential.tokenType
        self.expiresIn = credential.expiresIn
        self.refreshToken = credential.refreshToken
    }
}

extension UserCredentialUDS {
    func toDomain() -> UserAccessCredential {
        return .init(accessToken: accessToken,
                     tokenType: tokenType,
                     expiresIn: expiresIn,
                     refreshToken: refreshToken)
    }
}
