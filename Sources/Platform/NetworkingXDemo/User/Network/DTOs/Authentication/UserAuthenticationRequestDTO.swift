//
//  File.swift
//  
//
//   Created by Poshan Karki on 8/30/21.
//

import Foundation

struct UserAuthenticationRequestDTO: Encodable {
    private let userName: String
    private let loginPassword: String
    private let rememberMe: String
    private let fcmToken: String
    
    enum CodingKeys: String, CodingKey {
        case userName = "userName"
        case loginPassword = "userPassword"
        case rememberMe = "rememberMe"
        case fcmToken = "fcmId"
    }
    
    init(userName: String, loginPassword: String, rememberMe: String, fcmToken: String) {
        self.userName = userName
        self.loginPassword = loginPassword
        self.rememberMe = rememberMe
        self.fcmToken = fcmToken
    }
}

