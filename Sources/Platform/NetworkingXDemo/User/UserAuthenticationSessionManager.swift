
//
//  File.swift
//
//
//   Created by Poshan Karki on 8/30/21.
//

import Foundation
import NetworkingX
import NetworkingXDemo_Domain

public class UserAuthenticationSessionManager: NetworkSessionManager {
    
    var userAuthenticationRepository: UserAuthenticationRepository

    public init(userAuthenticationRepository: UserAuthenticationRepository) {
        self.userAuthenticationRepository = userAuthenticationRepository
    }

    @discardableResult
    public func request(_ request: URLRequest, completion: @escaping CompletionHandler) -> NetworkCallable {

        var newRequest = request
        if let userCredential = self.userAuthenticationRepository.credential {
            let authToken  = "\(userCredential.tokenType) \(userCredential.accessToken)"
            // Assign datahash and UserName
            newRequest.addValue(userCredential.accessToken, forHTTPHeaderField: "Authorization")
            newRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        }
        
        let task = URLSession.shared.dataTask(with: newRequest, completionHandler: completion)

        task.resume()

        return task
    }
}
