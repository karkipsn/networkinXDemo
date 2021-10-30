//
//  File.swift
//  
//
//  Created by Prashant Shrestha on 10/9/20.
//

import Foundation
import NetworkingX

// MARK: - Response Decoders
public class ErrorCheckDecoder: ResponseDecoder {
    private let jsonDecoder = JSONDecoder()
    
    public init() {
        jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
    }
    
    public func decode<T: Decodable>(_ data: Data) throws -> T {
        let response = try jsonDecoder.decode(ErrorCheckDecodable<T>.self, from: data)
        if let code = response.code, "\(code)" == "200", let data = response.data {
            return data
//        } else if let data = response.data {
//            return data
        } else if let errorResponseMessage = response.message {
            throw NetworkError.genericMessage(errorResponseMessage)
        }
        else {
            throw DataTransferError.noResponse
        }
    }
}

extension DateFormatter {
  static let iso8601Full: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}
