//
//  File.swift
//  
//
//  Created by Prashant Shrestha on 10/10/20.
//

import Foundation

public extension JSONEncoder {
    
    func encode<T>(_ value: T, encoderKey: CoderUserInfoKey? = nil) throws -> Data where T : Encodable {
        if let encoderKey = encoderKey {
            userInfo[.jsonEncoderName] = encoderKey
        }
        let root = try encode(value)
        return root
    }
}

public extension CodingUserInfoKey {
    static let jsonEncoderName = CodingUserInfoKey(rawValue: "jsonEncoderName")!
}
