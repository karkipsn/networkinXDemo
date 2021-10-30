//
//  File.swift
//  
//
//  Created by Prashant Shrestha on 11/1/20.
//

import Foundation
import NetworkingX
import NetworkingXDemo_Domain

class RepositoryTask: Resumable {
    
    var networkTask: NetworkCallable
    var isCancelled: Bool = false
    
    init(networkTask: NetworkCallable) {
        self.networkTask = networkTask
    }
    
    var progress: Progress {
        return networkTask.progress
    }
    
    func cancel() {
        networkTask.cancel()
        isCancelled = true
    }
    func resume() {
        networkTask.resume()
    }
    
    func suspend() {
        networkTask.suspend()
    }
}

extension NetworkCallable {
    func toResumable() -> Resumable {
        RepositoryTask(networkTask: self)
    }
}
