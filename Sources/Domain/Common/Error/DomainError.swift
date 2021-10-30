//
//  File.swift
//  
//
//  Created by Prashant Shrestha on 10/20/20.
//

import Foundation

public enum DomainError: Error {
    case noInternetConnection
    case needUpdate(_ message: String, _ isMandatory: Bool)
    case userSessionExpired
    case error(_ message: String)
    case contactCustomerSupport
    case ignorable
}
