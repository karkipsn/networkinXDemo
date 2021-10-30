//
//  File.swift
//
//
//   Created by Poshan Karki on 8/30/21.
//

import Foundation
import NetworkingX
import NetworkingXDemo_Domain

public final class DefaultCatalogsRepository {
    
    private let dataTransferService: DataTransferService
    
    public init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
       
    }
}

extension DefaultCatalogsRepository: CatalogsRepository {
    
    public func fetchGenderList(completion: @escaping (Result<[Gender], Error>) -> ()) {
        
        // We are returning static value so we are returning static value Here.
        let genderList = [Gender(id: "Male", value: "Male"),
                          Gender(id: "Female", value: "Female"),
                          Gender(id: "Others", value: "Others")]
        completion(.success(genderList))
        
        // For NetworkingX Implementation:
        
//        let requestDTO = CatalogRequestDTO(catalogType: CatalogType.bankList.rawValue)
//
//        let endpoint = CatalogEndpoints.getCatalog(requestDTO: requestDTO)
//
//        let task = self.dataTransferService.request(with: endpoint) { result in
//            switch result {
//            case .success(let result):
//                completion(.success(self.catalogResponseMapper(response: response)))
//            case .failure(let error):
//                completion(.failure(error.toDomainError()))
//            }
//        }
//        return task?.toResumable()
        
    }
    
    //MARK:- Fetching BankList From Server
    public func fetchBankList(with filter: BankFilter, completion: @escaping (Result<[Bank], Error>) -> ()) -> Resumable? {
        
        let requestDTO = CatalogRequestDTO(catalogType: CatalogType.bankList.rawValue,
                                           language: filter.language,
                                           additionalField1: filter.receivingCountry,
                                           additionalField2: filter.paymentMode,
                                           additionalField4: filter.receivingCurrency)
        
        let endpoint = CatalogEndpoints.getCatalog(requestDTO: requestDTO)
        
        let task = self.dataTransferService.request(with: endpoint) { result in
            
            switch result {
            case .success(let result):
                completion(.success(self.catalogResponseMapper(response: result)))
                
            case .failure(let error):
                completion(.failure(error.toDomainError()))
            }
        }
        return task?.toResumable()
    }
 
}

