//
//  FeedResponseDTO.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 12.02.2022.
//

import Foundation


struct SalesFeedResponseDTO: Decodable {
    let sales: [SaleDTO]?
}
