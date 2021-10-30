//
//  File.swift
//  
//
//  Created by Prashant Shrestha on 11/1/20.
//

import Foundation


public protocol Resumable {
    func cancel()
    func resume()
    func suspend()
    var progress: Progress { get }
}
