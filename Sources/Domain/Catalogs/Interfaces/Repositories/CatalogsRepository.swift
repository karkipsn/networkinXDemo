//
//  File.swift
//  
//
//  Created by Poshan Karki on 8/30/21.
//

import Foundation

public protocol CatalogsRepository {

    @discardableResult
    func fetchBankList(with filter: BankFilter, completion: @escaping (Result<[Bank], Error>) -> ()) -> Resumable?
    
    func fetchGenderList(completion: @escaping (Result<[Gender], Error>) -> ()) 

    
}

