//
//  UserLoginCredential.swift
//  
//
//  Created by Poshan Karki on 8/30/21.
//

import Foundation

public struct UserLoginCredential: Equatable {
    
    public let username: String
    public let password: String
    public let confirmPassword: String?
    public let rememberMe: String
    public let fcmToken: String?

    public init(username: String, password: String, confirmPassword: String? = nil, rememberMe: String, fcmToken: String? = nil) {
        self.username = username
        self.password = password
        self.confirmPassword = confirmPassword
        self.rememberMe = rememberMe
        self.fcmToken = fcmToken
    }
    
}
