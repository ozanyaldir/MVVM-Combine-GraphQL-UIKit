//
//  SaleViewModel.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 12.02.2022.
//

import Foundation

struct SaleViewModel {
    let sale: Sale
    
    var id: String {
        return sale.id
    }
    var title: String {
        return sale.title
    }
    var hotelDetails: String {
        return sale.hotelDetails
    }
}
