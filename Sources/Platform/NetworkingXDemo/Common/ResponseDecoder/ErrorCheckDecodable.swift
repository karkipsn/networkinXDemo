//
//  File.swift
//  
//
//  Created by Prashant Shrestha on 10/9/20.
//

import Foundation


struct ErrorCheckDecodable<T: Decodable>: Decodable {
    
    let code : Int?
    let message : String?
    let data : T?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(T.self, forKey: .data)
//        data = try? T(from: decoder)
    }

}

