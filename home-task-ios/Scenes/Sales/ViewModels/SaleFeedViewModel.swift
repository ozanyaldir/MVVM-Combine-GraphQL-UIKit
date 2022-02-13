//
//  SaleFeedViewModel.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 12.02.2022.
//

import Foundation

class SaleFeedViewModel {
    @Published private(set) var sales: [SaleViewModel] = []
    @Published private(set) var failureMessage: String?
    @Published private(set) var isLoading: Bool = false
    private let apiRepository = SEAPIRepositoryFactory.createSEAPIRepository()
    
    func fetchFeed() {
        self.isLoading = true
        self.apiRepository.listSales(affiliate: "es", limit: 300) { [weak self] result in
            self?.isLoading = false
            switch result{
            case .success(let sales):
                self?.sales = sales.map(SaleViewModel.init)
            case .failure(let error):
                print("Error occured fetching sales feed \(error.localizedDescription)")
                self?.failureMessage = "Error occured getting sales."
            }
        }
    }
}

