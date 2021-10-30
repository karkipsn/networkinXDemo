//
//  File.swift
//  
//
//  Created by Poshan on 7/1/21.
//

import Foundation
import NetworkingX

public class ErrorCheckResolver: DataTransferErrorResolver {
    public init() { }
    public func resolve(error: NetworkError) -> Error {
        var resolvedError = error
        switch error {
        case .error(let statusCode, let data):
            
            if statusCode == 404 {
                resolvedError = NetworkError.genericMessage("Resource not Found.")
            }
            else if let data = data,
               let errorResponse = try? JSONDecoder().decode(ErrorClass.self, from: data)
            {
                resolvedError = NetworkError.genericMessage(errorResponse.message ?? "Something Unkown Error Happened.")
            } else if let data = data,
                      let errorResponse = try? JSONDecoder().decode([ErrorObject].self, from: data) {
                resolvedError = NetworkError.genericMessage(errorResponse.first?.errorMessage ?? "Something Unkown Error Happened.")
            }
            else {
                resolvedError = NetworkError.unacceptableStatusCode(code: statusCode)
            }
        default:
            resolvedError = error
        }
        return resolvedError
    }
}


struct ErrorClass: Decodable {
    
    let code : Int?
    let message : String?
    let data : AllEncoderString?
    
    enum CodingKeys: String, CodingKey {
        
        case code = "code"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decodeIfPresent(Int.self, forKey: .code)
        message = try container.decodeIfPresent(String.self, forKey: .message)
        data = try container.decodeIfPresent(AllEncoderString.self, forKey: .data)
    }
    
//        enum CodingKeys2: String, CodingKey {
//            case code = "code"
//            case message = "message"
//            case data = "data"
//        }
//
    //    public init(from decoder: Decoder) throws {
    //        let coderKey = decoder.userInfo[.jsonDecoderName] as? CoderUserInfoKeys
    //        try self.init(from: decoder, decodingKey: coderKey ?? .type1)
    //    }
    
    //    init(from decoder: Decoder, decodingKey: CoderUserInfoKeys = .type1) throws {
    //        let coderKey = (decoder.userInfo[.jsonDecoderName] as? CoderUserInfoKeys) ?? decodingKey
    //        switch coderKey {
    //        case .type1:
    //            let container = try decoder.container(keyedBy: CodingKeys.self)
    //            code = try container.decodeIfPresent(Int.self, forKey: .code)
    //            message = try container.decodeIfPresent(String.self, forKey: .message)
    //            data = try container.decodeIfPresent(String.self, forKey: .data)
    //
    //        case .type2:
    //            let container = try decoder.container(keyedBy: CodingKeys2.self)
    //            code = try container.decodeIfPresent(Int.self, forKey: .code)
    //            message = try container.decodeIfPresent(String.self, forKey: .message)
    //            data = try container.decodeIfPresent(Int.self, forKey: .data)
    //        }
    //    }
    
}


struct ErrorObject: Decodable {
    
    let errorCode : Int?
    let errorMessage : String?
    let errorDescription : String?
    
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "errorcode"
        case errorMessage = "errormessage"
        case errorDescription = "errordescription"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errorCode = try values.decodeIfPresent(Int.self, forKey: .errorCode)
        errorMessage = try values.decodeIfPresent(String.self, forKey: .errorMessage)
        errorDescription = try values.decodeIfPresent(String.self, forKey: .errorDescription)
    }
    
}


struct AllEncoderString: Codable {
    
    let data: String
    
    init(_ data: String) {
        self.data = data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        // attempt to decode from all JSON primitives
        if let str = try? container.decode(String.self) {
            data = str
        } else if let int = try? container.decode(Int.self) {
            data = int.description
        } else if let double = try? container.decode(Double.self) {
            data = double.description
        } else if let bool = try? container.decode(Bool.self) {
            data = bool.description
        }
        // attempt to decode from first value of array of ErrorObject
        else if let obj = try? container.decode([ErrorObject].self) {
            data = obj.first?.errorMessage ?? "Some Unknown Error"
        }
        else {
            throw DecodingError.typeMismatch(String.self, .init(codingPath: decoder.codingPath, debugDescription: ""))
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(data)
    }
}
