//
//  NSAttributedString+String.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 13.02.2022.
//

import UIKit

// TODO: HTML parsing and visualization can be optimized.
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
}
