//
//  CatalogFilters.swift
//  Testing2
//
//  Created by Prashant Shrestha on 10/31/20.
//

import Foundation

// MARK: - CatalogFilter
public protocol CatalogFilter {
    var language: String { get }
}

// MARK: - NSCatalogFilter
public struct NSCatalogFilter: CatalogFilter {
    public let language: String

    public init(language: String) {
        self.language = language
    }
}

// MARK: - BankFilter
public struct BankFilter: CatalogFilter {
    public let language: String
    public let receivingCountry: String
    public let paymentMode: String
    public let receivingCurrency: String

    public init(language: String, receivingCountry: String, paymentMode: String, receivingCurrency: String) {
        self.language = language
        self.receivingCountry = receivingCountry
        self.paymentMode = paymentMode
        self.receivingCurrency = receivingCurrency
    }
}

