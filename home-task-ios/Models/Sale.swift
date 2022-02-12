//
//  Sale.swift
//  home-task-ios
//
//  Created by Sebastiano catellani on 17.05.21.
//

import Foundation

class Sale {

    let id: String
    let title: String
    let hotelDetails: String
    
    
    init(dto: SaleDTO){
        self.id = dto.id
        self.title = dto.title
        self.hotelDetails = dto.hotelDetails
    }
}
