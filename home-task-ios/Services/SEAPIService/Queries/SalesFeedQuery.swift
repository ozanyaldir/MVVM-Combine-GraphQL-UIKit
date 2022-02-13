//
//  SalesFeedQuery.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 12.02.2022.
//

import Foundation

class SalesFeedQuery: BaseQuery {
    
    // TODO: Mock data sources structure can be optimized. Tried to do the simplest in limited time.
    static let mockResponse: Data! = {
        guard let path = Bundle(for: SalesFeedQuery.self).url(forResource: "sale-list", withExtension: "json") else {
            fatalError("sale-list file is not found")
        }
        do {
            let data = try Data(contentsOf: path, options: .alwaysMapped)
            return data
        } catch let error {
            fatalError("sale-list file is not found \(error.localizedDescription)")
        }
    }()
    
    init(affiliate: String, limit:Int) {
        super.init()
        self.query = """
            {
                sales(
                    affiliate: "\(affiliate)",
                    limit: \(limit)
                ) {
                    id
                    title
                    hotelDetails
                }
            }
        """
    }
}
