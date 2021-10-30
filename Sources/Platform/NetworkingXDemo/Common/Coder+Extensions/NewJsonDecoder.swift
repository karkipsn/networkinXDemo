//
//  File.swift
//  
//
//  Created by Poshan on 4/11/21.
//
import Foundation
import NetworkingX

public class NewJSONResponseDecoder: ResponseDecoder {
    private let jsonDecoder = JSONDecoder()
    public init() {
        jsonDecoder.dateDecodingStrategy = .iso8601
    }
    public func decode<T: Decodable>(_ data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}
