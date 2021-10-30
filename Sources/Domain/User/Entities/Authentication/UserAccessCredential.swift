//
//  File.swift
//  
//
//  Created by Poshan Karki on 7/17/21.
//

import Foundation

public struct UserAccessCredential: Equatable {
    
    public let accessToken: String
    public let tokenType: String
    public let expiresIn: String
    public let refreshToken: String
    
    public init(accessToken: String,
                tokenType: String,
                expiresIn: String,
                refreshToken: String) {
        
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.expiresIn = expiresIn
        self.refreshToken = refreshToken
    }
}
