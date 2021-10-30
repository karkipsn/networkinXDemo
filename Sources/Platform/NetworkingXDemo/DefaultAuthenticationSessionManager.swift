//
//  File.swift
//  
//
//  Created by Poshan Karki on 8/30/21.
//

import Foundation
import NetworkingX

public class DefaultAuthenticationSessionManager: NetworkSessionManager {

    public init () {}
    
    public func request(_ request: URLRequest, completion: @escaping CompletionHandler) -> NetworkCallable {
        
        var newRequest = request
        newRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: newRequest, completionHandler: completion)
        task.resume()
        
        return task
    }
    
}
