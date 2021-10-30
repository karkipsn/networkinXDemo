//
//  Catalog.swift
//  Testing2
//
//  Created by Poshan Karki on 8/30/21.
//

import Foundation

public struct NSCatalog: Catalog, Equatable {
    public let id: String
    public let value: String

    public init(id: String, value: String) {
        self.id = id
        self.value = value
    }
}

public struct Country: Codable, Catalog, Equatable {
    public let id: String
    public let value: String
    public var countryName: String?
    public let telephoneCode: String?
    public let telephoneLength: String?
    public let currencyCode: String?
    public let iso2: String?
    public let iso3: String?

    public init(id: String, value: String, countryName: String? = nil, telephoneCode: String? = nil, telephoneLength: String? = nil, currencyCode: String? = nil, iso2: String? = nil, iso3: String? = nil) {
        self.id = id
        self.value = value
        self.telephoneCode = telephoneCode
        self.countryName = countryName
        self.telephoneLength = telephoneLength
        self.currencyCode = currencyCode
        self.iso2 = iso2
        self.iso3 = iso3
    }
}


public extension Country {
    func asNSCatalog() -> NSCatalog {
        return NSCatalog(
            id: id,
            value: value
        )
    }
}

public typealias Gender = NSCatalog
public typealias Bank = NSCatalog

