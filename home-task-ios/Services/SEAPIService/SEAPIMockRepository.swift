//
//  SEAPIMockRepository.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 13.02.2022.
//

import Foundation

struct SEAPIMockRepository: SEAPIRepositoryInterface {
    let apiService = SEAPIService()
    
    func listSales(affiliate: String, limit: Int, completion: @escaping (Result<[Sale], SEAPIRepositoryError>) -> ()) {
        guard let mockData = SalesFeedQuery.mockResponse else{
            fatalError("Could not get mock sales feed")
        }
        do {
            let mockResponse = try JSONDecoder().decode(BaseResponseDTO<SalesFeedResponseDTO>.self, from: mockData)
            let saleDTOs = mockResponse.data?.sales
            guard let sales = saleDTOs?.map(Sale.init) else {
                fatalError("Failed mapping mock Sales Feed DTOs")
            }
            return completion(.success(sales))
        } catch {
            fatalError("Could not parse mock sales feed")
        }
    }
}
