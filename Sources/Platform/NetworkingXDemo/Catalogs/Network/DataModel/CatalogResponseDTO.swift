//
//  File.swift
//  
//
//  Created by Poshan Karki on 8/30/21.
//

import Foundation
import NetworkingXDemo_Domain

// MARK: - CatalogueList
public struct CatalogResponseDTO: Codable {
  
    let id: String?
    let value: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case value
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        value = try container.decodeIfPresent(String.self, forKey: .value) ?? ""
    }
}
