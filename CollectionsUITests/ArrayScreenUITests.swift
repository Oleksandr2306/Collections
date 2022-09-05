//
//  ArrayScreenUITests.swift
//  CollectionsUITests
//
//  Created by Oleksandr Melnyk on 23.08.2022.
//

import XCTest

final class ArrayScreenUITests: XCTestCase {
    
    private var app: XCUIApplication!
    lazy private var menuOption = app.tables.cells["MenuOption"].staticTexts["Array"]
    lazy private var arrayCreation = app.staticTexts["ArrayCreation"]
    lazy private var arrayOptions = [app.collectionViews.staticTexts["Insert 1000 elements at the beginning of the array one-by-one"],
                                     app.collectionViews.staticTexts["Insert 1000 elements at the beginning of the array"],
                                     app.collectionViews.staticTexts["Insert 1000 elements in the middle of the array one-by-one"],
                                     app.collectionViews.staticTexts["Insert 1000 elements in the middle of the array"],
                                     app.collectionViews.staticTexts["Insert 1000 elements at the end of the array one-by-one"],
                                     app.collectionViews.staticTexts["Insert 1000 elements at the end of the array all at once"],
                                     app.collectionViews.staticTexts["Remove 1000 elements at the beginning of the array one-by-one"],
                                     app.collectionViews.staticTexts["Remove 1000 elements at the beginning of the array"],
                                     app.collectionViews.staticTexts["Remove 1000 elements in the middle of the array one-by-one"],
                                     app.collectionViews.staticTexts["Remove 1000 elements in the middle of the array"],
                                     app.collectionViews.staticTexts["Remove 1000 elements at the end of the array one-by-one"],
                                     app.collectionViews.staticTexts["Remove 1000 elements at the end"]]
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func test_UIExists() throws {
        menuOption.tap()
        arrayCreation.tap()
        let result = XCTWaiter.wait(for: [expectation(description: "Array is created")], timeout: 10.0)
        if result == XCTWaiter.Result.timedOut {
            for element in arrayOptions {
                XCTAssertTrue(element.exists)
            }
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_arrayOperation_worksFine() throws {
        menuOption.tap()
        arrayCreation.tap()
        let result = XCTWaiter.wait(for: [expectation(description: "Array is created")], timeout: 10.0)
        if result == XCTWaiter.Result.timedOut {
            arrayOptions[arrayOptions.endIndex - 1].tap()
            XCTAssertTrue(app.staticTexts["Execution time: 0.000 s."].exists)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
}

