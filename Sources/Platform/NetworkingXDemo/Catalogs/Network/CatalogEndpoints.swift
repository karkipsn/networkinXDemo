//
//  File.swift
//  
//
//   Created by Poshan Karki on 8/30/21.
//

import Foundation
import NetworkingX

struct CatalogEndpoints {
    
    static func getCatalog(requestDTO: CatalogRequestDTO) -> Endpoint<[CatalogResponseDTO]> {
        let path = "pathtoCatalog"
    
        return Endpoint(path: path,
                        method: .get,
                        queryParametersEncodable: requestDTO)
    }
        
}
