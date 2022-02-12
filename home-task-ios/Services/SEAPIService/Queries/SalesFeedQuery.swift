//
//  SalesFeedQuery.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 12.02.2022.
//

import Foundation

class SalesFeedQuery: BaseQuery {
    
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
