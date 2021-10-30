//
//  File.swift
//  
//
//   Created by Poshan Karki on 8/30/21.
//

import Foundation
import NetworkingXDemo_Domain

extension DefaultCatalogsRepository {
    
     func catalogResponseMapper(response: [CatalogResponseDTO]) -> [NSCatalog] {
        response.map{ NSCatalog(
            id: $0.id ?? "",
            value: $0.value ?? "")}
    }
}

