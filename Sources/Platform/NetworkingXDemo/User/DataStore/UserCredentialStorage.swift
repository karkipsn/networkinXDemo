//
//  File.swift
//  
//
//   Created by Poshan Karki on 8/30/21.
//

import Foundation
import NetworkingXDemo_Domain

protocol UserCredentialStorage {
    func saveCredential(credential: UserAccessCredential, completion: @escaping (Result<UserAccessCredential, Error>) -> Void)
    func getCredential() throws  -> UserAccessCredential
    func deleteCredential()
}
