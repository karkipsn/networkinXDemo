//
//  UserAuthenticationRepository.swift
//  
//
//  Created by Poshan Karki on 8/30/21.
//

import Foundation

public protocol UserAuthenticationRepository {
    var credential: UserAccessCredential? { get }
    
    @discardableResult
    func authenticateUser(loginInfo: UserLoginCredential, completion: @escaping ( (Result<UserAccessCredential, Error>) -> Void)) -> Resumable?
    
    func clearCredential()
    
}
