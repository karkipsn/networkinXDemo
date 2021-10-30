//
//  File.swift
//  
//
//  Created by Poshan on 8/28/21.
//

import Foundation
import CommonCrypto

extension String {
    
    func convertToSHA256() -> String {
        let data = self.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CC_SHA256((data as NSData).bytes, CC_LONG(data.count), &hash)
        let resstr = NSMutableString()
        for byte in hash {
            resstr.appendFormat("%02hhx", byte)
        }
        return resstr.uppercased
    }
    
    var toIntValue: Int {
        let intValue =  Int(self)
        return intValue ?? 0
    }
}
