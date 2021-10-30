//
//  File.swift
//  
//
//  Created by Prashant Shrestha on 10/10/20.
//

import Foundation

public extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, from data: Data, decoderKey: CoderUserInfoKey) throws -> T {
        userInfo[.jsonDecoderName] = decoderKey
        return try decode(T.self, from: data)
    }
}

public extension CodingUserInfoKey {
    static let jsonDecoderName = CodingUserInfoKey(rawValue: "jsonDecoderName")!
}
