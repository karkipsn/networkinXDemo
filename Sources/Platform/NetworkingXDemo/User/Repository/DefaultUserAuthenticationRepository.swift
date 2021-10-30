//
//  File.swift
//  
//
//   Created by Poshan Karki on 8/30/21.
//

import Foundation
import NetworkingX
import DataStoreX
import NetworkingXDemo_Domain

public final class DefaultUserAuthenticationRepository {
    
    private let dataTransferService: DataTransferService
    private let storage: UserCredentialStorage
    
    public init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
        self.storage = UserCredentialUDStorage()
    }
}

extension DefaultUserAuthenticationRepository: UserAuthenticationRepository {
    
    public var credential: UserAccessCredential? {
        return try? storage.getCredential()
    }
    
    public func authenticateUser(loginInfo: UserLoginCredential, completion: @escaping ( (Result<UserAccessCredential, Error>) -> Void)) -> Resumable? {
        
        
        let requestDTO = loginInfo.toRequestDTO()
        let endpoint = UserEndpoints.authenticateUser(requestDTO: requestDTO)
        
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                    
                    // Save the response in datastore 
                    self.storage.saveCredential(credential: responseDTO.toDomain(), completion: completion)
              

            case .failure(let error):
                completion(.failure(error.toDomainError()))
            }
        }
        return task?.toResumable()
    }
    
    
    public func clearCredential() {
        storage.deleteCredential()
    }
}
