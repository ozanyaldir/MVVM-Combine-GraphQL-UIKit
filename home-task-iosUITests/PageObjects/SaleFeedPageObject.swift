//
//  SaleFeedPageObject.swift
//  home-task-iosUITests
//
//  Created by Ozan Yaldır on 13.02.2022.
//

import Foundation
import XCTest

class SaleFeedPageObject: BasePageObject{
    
    var saleFeedTableView: XCUIElement{
        app.tables["saleFeedTableView"]
    }
    var refreshControl: XCUIElement{
        app.tables["saleFeedTableViewRefreshControl"]
    }
    
}
