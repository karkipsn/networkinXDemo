//
//  File.swift
//  
//
//   Created by Poshan Karki on 8/30/21.
//

import Foundation
import NetworkingXDemo_Domain

final class UserCredentialUDStorage {
    
    private let userCredentialKey = "userCredential"
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    private func fetchUserCredential() throws -> UserAccessCredential {
        if let credentialData = userDefaults.object(forKey: userCredentialKey) as? Data {
            if let data = try? JSONDecoder().decode(UserCredentialUDS.self, from: credentialData) {
                return data.toDomain()
            }
        }
        throw NSError(domain: "appCredential",
                      code: 102,
                      userInfo: [NSLocalizedDescriptionKey: "User Credential fetch failed"])
    }
    
    private func persist(credential: UserAccessCredential) {
        let encoder = JSONEncoder()
        let credentialUDS = UserCredentialUDS(credential: credential)
        if let encoded = try? encoder.encode(credentialUDS) {
            userDefaults.set(encoded, forKey: userCredentialKey)
        }
    }
    
    private func remove() {
        userDefaults.set(nil, forKey: userCredentialKey)
    }
}

extension UserCredentialUDStorage: UserCredentialStorage {
    
    func getCredential() throws  -> UserAccessCredential {
        return try self.fetchUserCredential()
    }
    
    func saveCredential(credential: UserAccessCredential, completion: @escaping (Result<UserAccessCredential, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            let savedCredential = try? self.fetchUserCredential()
            if credential != savedCredential {
                self.persist(credential: credential)
                completion(.success(credential))
            }
//            completion(.success(credential))
        }
    }
    
    func deleteCredential() {
        remove()
    }
}

