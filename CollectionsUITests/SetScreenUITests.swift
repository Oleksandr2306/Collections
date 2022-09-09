//
//  SetScreenUITests.swift
//  CollectionsUITests
//
//  Created by Oleksandr Melnyk on 23.08.2022.
//

import XCTest

final class SetScreenUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private lazy var menuOption = app.tables.cells["MenuOption"].staticTexts["Set"]
    private lazy var allMatchesButton = app.buttons["AllMatchesButton"]
    private lazy var allNotMatchesButton = app.buttons["AllNotMatchesButton"]
    private lazy var allUniqueCharactersButton = app.buttons["AllUniqueCharactersButton"]
    private lazy var allMatchesLabel = app.staticTexts["AllMatchesLabel"]
    private lazy var allNotMatchesLabel = app.staticTexts["AllNotMatchesButton"]
    private lazy var allUniqueCharactersLabel = app.staticTexts["AllUniqueCharactersButton"]
    private lazy var inputTextField = app.textFields["InputTextField"]
    private lazy var additionalTextField = app.textFields["AdditionalTextField"]
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func test_UIExists() throws {
        menuOption.tap()
        
        XCTAssertTrue(allMatchesButton.exists)
        XCTAssertTrue(allNotMatchesButton.exists)
        XCTAssertTrue(allUniqueCharactersButton.exists)
        XCTAssertTrue(allMatchesLabel.exists)
        XCTAssertTrue(allNotMatchesLabel.exists)
        XCTAssertTrue(allUniqueCharactersLabel.exists)
        XCTAssertTrue(inputTextField.exists)
        XCTAssertTrue(additionalTextField.exists)
    }
 
    func test_correctTextFieldsInput() throws {
        menuOption.tap()
        
        inputTextField.tap()
        inputTextField.typeText("qwerty123qw")
        var result = inputTextField.value as! String
        var expectedResult = "qwertyqw"
        XCTAssertEqual(result, expectedResult)
        app.buttons["Return"].tap()
        
        additionalTextField.tap()
        additionalTextField.typeText("qwerty123qw")
        result = additionalTextField.value as! String
        expectedResult = "qwertyqw"
        XCTAssertEqual(result, expectedResult)
    }
    
}

