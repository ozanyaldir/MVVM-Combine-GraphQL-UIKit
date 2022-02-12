//
//  BaseQuery.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 12.02.2022.
//

import Foundation

class BaseQuery: Encodable {

    public var query: String!

    enum CodingKeys: String, CodingKey {
        case query
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.query, forKey: .query)
    }
}
