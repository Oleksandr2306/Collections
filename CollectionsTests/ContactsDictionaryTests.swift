//
//  DictionaryTests.swift
//  CollectionsTests
//
//  Created by Oleksandr Melnyk on 23.08.2022.
//

import XCTest
@testable import Collections

final class ContactsDictionaryTests: XCTestCase {
    
    private var sut: ContactsDictionaryManager!
    
    override func setUp() {
        sut = ContactsDictionaryManager()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_dictionaryCreation() throws {
        let expectation = expectation(description: "Dictionary is created")
        sut.createDictionary {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10.0) { (error) in
            if error != nil {
                XCTFail()
            } else {
                let expectedArraySize = self.sut.dictionarySize
                let expectedResult = 10_000_000
                XCTAssertEqual(expectedArraySize, expectedResult)
            }
        }
    }
    
    
    func test_getFirstElement() throws {
        let expectation = expectation(description: "First element found")
        sut.createDictionary {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let firstElement = self.sut.getFirst
                let expectedElement = "0"
                XCTAssertEqual(firstElement, expectedElement)
            }
        }
    }
    
    func test_getLastElement() throws {
        let expectation = expectation(description: "Last element found")
        sut.createDictionary {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let firstElement = self.sut.getLast
                let expectedElement = "\(self.sut.dictionarySize - 1)"
                XCTAssertEqual(firstElement, expectedElement)
            }
        }
    }
}


