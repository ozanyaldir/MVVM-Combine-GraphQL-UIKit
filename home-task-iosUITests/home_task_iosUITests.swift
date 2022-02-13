//
//  home_task_iosUITests.swift
//  home-task-iosUITests
//
//  Created by Sebastiano catellani on 17.05.21.
//

import XCTest

class when_app_is_launched: XCTestCase {
    var app: XCUIApplication!
    var saleFeedPageObject: SaleFeedPageObject!
    var saleDetailsPageObject: SaleDetailsPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        saleFeedPageObject = SaleFeedPageObject(app: app)
        saleDetailsPageObject = SaleDetailsPageObject(app: app)
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
    }
    
    func test_should_display_sales_feed_table_view(){
        let _ = self.saleFeedPageObject.saleFeedTableView.waitForExistence(timeout: 2.0)
        XCTAssertTrue(self.saleFeedPageObject.saleFeedTableView.exists)
    }
    
    func test_should_display_sales_feed_items_filled(){
        let _ = self.saleFeedPageObject.saleFeedTableView.waitForExistence(timeout: 2.0)
        XCTAssertEqual(self.saleFeedPageObject.saleFeedTableView.cells.count, 1)
    }
    
    func test_should_refresh_sales_feed(){
        let _ = self.saleFeedPageObject.saleFeedTableView.waitForExistence(timeout: 2.0)
        let firstCell = self.saleFeedPageObject.saleFeedTableView.cells.firstMatch
        let start = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let finish = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 10))
        start.press(forDuration: 0, thenDragTo: finish)
        XCTAssertTrue(self.saleFeedPageObject.saleFeedTableView.exists)
        XCTAssertEqual(self.saleFeedPageObject.saleFeedTableView.cells.count, 1)
    }
    
}

class when_sale_feed_is_displayed: XCTestCase {
    var app: XCUIApplication!
    var saleFeedPageObject: SaleFeedPageObject!
    var saleDetailsPageObject: SaleDetailsPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        saleFeedPageObject = SaleFeedPageObject(app: app)
        saleDetailsPageObject = SaleDetailsPageObject(app: app)
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
        let _ = self.saleFeedPageObject.saleFeedTableView.waitForExistence(timeout: 2.0)
        self.saleFeedPageObject.saleFeedTableView.cells.element(boundBy: 0).tap()
    }
    
    func test_should_display_sale_details_page(){
        let _ = self.saleDetailsPageObject.scrollView.waitForExistence(timeout: 2.0)
        XCTAssertTrue(self.saleDetailsPageObject.scrollView.exists)
    }
    
    func test_should_display_sale_details_page_content(){
        let _ = self.saleDetailsPageObject.scrollView.waitForExistence(timeout: 2.0)
        XCTAssertTrue(self.saleDetailsPageObject.idLabel.exists)
        XCTAssertTrue(self.saleDetailsPageObject.titleLabel.exists)
        XCTAssertTrue(self.saleDetailsPageObject.detailLabel.exists)
    }
    
    func test_should_dismiss_sale_details_page(){
        let _ = self.saleDetailsPageObject.scrollView.waitForExistence(timeout: 2.0)
        XCTAssertTrue(self.saleDetailsPageObject.dismissButton.exists)
        self.saleDetailsPageObject.dismissButton.tap()
        XCTAssertFalse(self.saleDetailsPageObject.scrollView.exists)
    }
}

//let apiRepository = SEAPIRepositoryFactory.createSEAPIRepository()
//apiRepository.listSales(affiliate: "es", limit: 300) { result in
//    switch result{
//    case .success(let sales):
//        guard let firstMatch = sales.first else{
//            return XCTFail()
//        }
//        print("sales: \(sales.first?.id)")
//
//    case .failure(let error):
//        return XCTFail("Error occured fetching sales feed \(error.localizedDescription)")
//    }
//}
