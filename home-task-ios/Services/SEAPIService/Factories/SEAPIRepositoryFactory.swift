//
//  SEAPIRepositoryFactory.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 13.02.2022.
//

import Foundation

class SEAPIRepositoryFactory{
    
    static func createSEAPIRepository() -> SEAPIRepositoryInterface{
        let environment = ProcessInfo.processInfo.environment["ENV"]
        switch environment{
        case "TEST":
            return SEAPIMockRepository()
        default:
            return SEAPIRepository()
        }
    }
}
