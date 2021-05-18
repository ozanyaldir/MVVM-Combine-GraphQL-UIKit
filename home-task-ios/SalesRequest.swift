//
//  SalesRequest.swift
//  home-task-ios
//
//  Created by Sebastiano catellani on 17.05.21.
//

import Foundation

struct SalesRequest: Encodable {

    public var query: String {
        return """
        {
            sales(
                affiliate: "es",
                limit: 300
            ) {
                id
                title
            }
        }
    """
    }

    enum CodingKeys: String, CodingKey {
        case query
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.query, forKey: .query)
    }
}
