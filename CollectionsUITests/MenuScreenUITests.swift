//
//  ArrayTest.swift
//  CollectionsTests
//
//  Created by Oleksandr Melnyk on 22.08.2022.
//

import XCTest

final class ArrayTest: XCTestCase {

    private var app: XCUIApplication!
    private lazy var menuOptions = [app.tables.cells["MenuOption"].staticTexts["Array"],
                                    app.tables.cells["MenuOption"].staticTexts["Set"],
                                    app.tables.cells["MenuOption"].staticTexts["Dictionary"]]
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func test_UIExists() throws {
        for element in menuOptions {
            XCTAssertTrue(element.exists)
        }
    }
}
