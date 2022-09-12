//
//  SetTests.swift
//  CollectionsTests
//
//  Created by Oleksandr Melnyk on 22.08.2022.
//

import XCTest
@testable import Collections

final class SetTests: XCTestCase {

    private var sut: SetManager!

    override func setUp() {
        sut = SetManager()
    }
    
    override func tearDown() {
        sut = nil
    }

    func test_characters_fromBoth() throws {
        let result = sut.characters(in: "qwerty", matching: "tw")
        let expectedResult: Set<String.Element> = ["t", "w"]
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_notMatchingCharacters_fromBoth() throws {
        let result = sut.notMatchingCharacters(in: "qwerty", and: "w")
        let expectedResult: Set<String.Element> = ["q", "e", "r", "t", "y"]
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_uniqueCharacters_fromFirst() throws {
        let result = sut.uniqueCharacters(from: "qwerty", excluding: "qwyuio")
        let expectedResult: Set<String.Element> = ["e", "r", "t"]
        
        XCTAssertEqual(result, expectedResult)
    }
    
}


