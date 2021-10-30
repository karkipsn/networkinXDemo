//
//  File.swift
//  
//
//  Created by Prashant Shrestha on 11/1/20.
//

import Foundation
import NetworkingX
import NetworkingXDemo_Domain


public extension Error {
    func toDomainError() -> DomainError {
        switch (self as Error) {
        case DataTransferError.networkFailure(let networkError):
            return networkError.toDomainError()
        case DataTransferError.resolvedNetworkFailure(let error):
            return error.toDomainError()
        case DataTransferError.parsing(let error):
            return error.toDomainError()
        case NetworkError.notConnected:
            return .noInternetConnection
        case NetworkError.cancelled:
            return .ignorable
        case NetworkError.genericMessage(let message):
            return .error(message)
        case NetworkError.generic(let error):
            return .error(error.localizedDescription)
        case NetworkError.urlGeneration:
            return .error("The page/resource you are looking is not Found.")
        default:
            if let domainError = self as? DomainError {
                return domainError
            } else {
                return .contactCustomerSupport
            }
        }
    }
}
