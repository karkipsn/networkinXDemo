//
//  File.swift
//  
//
//  Created by Poshan Karki on 8/30/21.
//

import Foundation

struct CatalogRequestDTO: Encodable {
    let catalogType: String
    let language: String?
    let additionalField1: String?
    let additionalField2: String?
    let additionalField3: String?
    let additionalField4: String?
    
    init(catalogType: String, language: String? = nil, additionalField1: String? = nil, additionalField2: String? = nil, additionalField3: String? = nil, additionalField4: String? = nil) {
        self.catalogType = catalogType
        self.language = language
        self.additionalField1 = additionalField1
        self.additionalField2 = additionalField2
        self.additionalField3 = additionalField3
        self.additionalField4 = additionalField4
    }
    
    enum CodingKeys: String, CodingKey {
        case catalogType = "typeId"
        case language = "language"
        case additionalField1 = "additional_field1"
        case additionalField2 = "additional_field2"
        case additionalField3 = "additional_field3"
        case additionalField4 = "additional_field4"
    }
    
}

