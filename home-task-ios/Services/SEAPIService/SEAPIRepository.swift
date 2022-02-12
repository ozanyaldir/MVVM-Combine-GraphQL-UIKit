//
//  SEAPIRepository.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 12.02.2022.
//

import Foundation

enum SEAPIRepositoryError: Error{
    case mapping(message: String)
    case unknown(message: String)
}

struct SEAPIRepository {
    let apiService = SEAPIService()
    
    func fetchSalesFeed(affiliate: String, limit: Int, completion: @escaping (Result<[Sale], SEAPIRepositoryError>) -> ()) {
        let query = SalesFeedQuery.init(affiliate: affiliate, limit: limit)
        self.apiService.executeQuery(query: query) { (result: Result<SalesFeedResponseDTO, SEAPICallError>) in
            switch result{
            case .success(let responseData):
                let saleDTOs = responseData.sales
                guard let sales = saleDTOs?.map(Sale.init) else {
                    return completion(.failure(.mapping(message: "Failed mapping Sales Feed DTOs")))
                }
                return completion(.success(sales))
            case .failure(let error):
                return completion(.failure(.unknown(message: error.localizedDescription)))
            }
        }
    }
}
