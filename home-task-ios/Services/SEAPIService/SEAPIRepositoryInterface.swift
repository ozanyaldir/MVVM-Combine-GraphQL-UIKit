//
//  SEAPIRepositoryInterface.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 13.02.2022.
//

import Foundation

enum SEAPIRepositoryError: Error{
    case mapping(message: String)
    case unknown(message: String)
}

protocol SEAPIRepositoryInterface {
    func listSales(affiliate: String, limit: Int, completion: @escaping (Result<[Sale], SEAPIRepositoryError>) -> ())
}
