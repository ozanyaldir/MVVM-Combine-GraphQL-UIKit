//
//  SaleDetailsPageObject.swift
//  home-task-iosUITests
//
//  Created by Ozan Yaldır on 13.02.2022.
//

import Foundation
import XCTest

class SaleDetailsPageObject: BasePageObject{
    
    var scrollView: XCUIElement{
        app.scrollViews["saleDetailPageScrollView"]
    }
    var dismissButton: XCUIElement{
        app.buttons["saleDetailPageDismissButton"]
    }
    var idLabel: XCUIElement{
        app.staticTexts["saleDetailPageIdLabel"]
    }
    var titleLabel: XCUIElement{
        app.staticTexts["saleDetailPageTitleLabel"]
    }
    var detailLabel: XCUIElement{
        app.staticTexts["saleDetailPageDetailLabel"]
    }
    
}
