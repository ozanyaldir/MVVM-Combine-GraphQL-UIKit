//
//  SEAPIConstants.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 12.02.2022.
//

import Foundation

// FIXME: Sensitive data kept hard coded here
struct SEAPIConstants{
    static let baseURL = URL(string: "https://w7szo4xfvg.execute-api.eu-central-1.amazonaws.com/staging/graphql")!
    static let httpMethod = "POST"
    static let defaultHeaders = [
        "Content-Type": "application/json",
        "x-api-key": "1lVkC4YOx1acSOia7dUH093PFCeaKk0a6zEUYR3x"
    ]
    
    struct Messages {
        static let responseMappingFailure = "Response Mapping Failed"
        static let unknownError = "Unknown error occured"
    }
}
