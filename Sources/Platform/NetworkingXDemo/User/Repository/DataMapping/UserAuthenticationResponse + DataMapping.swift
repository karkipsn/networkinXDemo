//
//  File.swift
//  
//
//   Created by Poshan Karki on 8/30/21.
//

import Foundation
import NetworkingXDemo_Domain

extension UserAuthenticationResponseDTO {
    
        
        func toDomain() -> UserAccessCredential {
            return .init(accessToken: token.value ,
                         tokenType: tokenType ,
                         expiresIn: token.validTo ,
                         refreshToken: refreshToken)
    }
}

extension UserLoginCredential {
    
    func toRequestDTO() -> UserAuthenticationRequestDTO {
        return .init(userName: username,
                     loginPassword: password,
                     rememberMe: rememberMe,
                     fcmToken: fcmToken ?? "")
    }
}
