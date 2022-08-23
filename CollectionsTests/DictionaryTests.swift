//
//  DictionaryTests.swift
//  CollectionsTests
//
//  Created by Oleksandr Melnyk on 23.08.2022.
//

import XCTest
@testable import Collections

final class DictionaryTests: XCTestCase {

    private var sut: DictionaryManager!

    override func setUp() {
        sut = DictionaryManager()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_dictionaryCreation() throws {
        sut.createDictionary {
            let result = self.sut.getSize()
            let expectedResult = 10_000_000
            XCTAssertEqual(result, expectedResult)
        }
    }
    
    func test_getFirstElement() throws {
        sut.createDictionary {
            let result = self.sut.getFirst()
            let expectedResult = "0"
            XCTAssertEqual(result, expectedResult)
        }
    }
    
    func test_getLastElement() throws {
        sut.createDictionary {
            let result = self.sut.getLast()
            let expectedResult = "\(self.sut.getSize() - 1)"
            XCTAssertEqual(result, expectedResult)
        }
    }
}
