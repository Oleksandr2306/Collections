//
//  SetTests.swift
//  CollectionsTests
//
//  Created by Oleksandr Melnyk on 22.08.2022.
//

import XCTest
@testable import Collections

class SetTests: XCTestCase {

    private var sut: SetManager!

    override func setUp() {
        sut = SetManager()
    }
    
    override func tearDown() {
        sut = nil
    }

    func test_allMatchingCharacters_fromBoth() throws {
        let result = sut.allMatchingCharacters(for: "qwerty", and: "tw")
        let expectedResult: Set<String.Element> = ["t", "w"]
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_allNotMatchingCharacters_fromBoth() throws {
        let result = sut.allNotMatchingCharacters(for: "qwerty", and: "w")
        let expectedResult: Set<String.Element> = ["q", "e", "r", "t", "y"]
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_allUniqueCharacters_fromFirst() throws {
        let result = sut.allUniqueCharacters(from: "qwerty", butNotFrom: "qwyuio")
        let expectedResult: Set<String.Element> = ["e", "r", "t"]
        
        XCTAssertEqual(result, expectedResult)
    }
    
}
