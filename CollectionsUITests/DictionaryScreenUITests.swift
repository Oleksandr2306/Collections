//
//  DictionaryScreenUITests.swift
//  CollectionsUITests
//
//  Created by Oleksandr Melnyk on 23.08.2022.
//

import XCTest

final class DictionaryScreenUITests: XCTestCase {

    private var app: XCUIApplication!
    lazy private var menuOption = app.tables.cells["MenuOption"].staticTexts["Dictionary"]
    lazy private var dictionaryOptions = [app.collectionViews.staticTexts["Find the first element"],
                             app.collectionViews.staticTexts["Find the last element"],
                             app.collectionViews.staticTexts["Search for a non-existing element"]]

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func test_collectionRows_exist() throws {
        menuOption.tap()
        let result = XCTWaiter.wait(for: [expectation(description: "Array and dictionary are created")], timeout: 15.0)
        if result == XCTWaiter.Result.timedOut {
            for element in dictionaryOptions {
                XCTAssertTrue(element.exists)
            }
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_dictionaryOperation_worksFine() throws {
        menuOption.tap()
        let result = XCTWaiter.wait(for: [expectation(description: "Array and dictionary are created")], timeout: 20.0)
        if result == XCTWaiter.Result.timedOut {
            app.collectionViews.cells.element(boundBy: 1).tap()
            XCTAssertTrue(app.staticTexts["First element search time: 0.000 s. Result number: 0"].exists)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
}


