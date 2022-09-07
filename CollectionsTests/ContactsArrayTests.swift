//
//  ContactsArrayTests.swift
//  CollectionsTests
//
//  Created by Oleksandr Melnyk on 06.09.2022.
//

import XCTest
@testable import Collections

class ContactsArrayTests: XCTestCase {
    
    private var sut: ContactsArrayManager!
    
    override func setUp() {
        sut = ContactsArrayManager()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_arrayCreation() throws {
        let expectation = expectation(description: "Array is created")
        sut.createArray {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5.0) { (error) in
            if error != nil {
                XCTFail()
            } else {
                let expectedArraySize = self.sut.arraySize
                let expectedResult = 10_000_000
                XCTAssertEqual(expectedArraySize, expectedResult)
            }
        }
    }
    
    
    func test_getFirstElement() throws {
        let expectation = expectation(description: "First element found")
        sut.createArray {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let firstElement = self.sut.first?.phone
                let expectedElement = "0"
                XCTAssertEqual(firstElement, expectedElement)
            }
        }
    }
    
    func test_getLastElement() throws {
        let expectation = expectation(description: "Last element found")
        sut.createArray {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let firstElement = self.sut.last?.phone
                let expectedElement = "\(self.sut.arraySize - 1)"
                XCTAssertEqual(firstElement, expectedElement)
            }
        }
    }
    
}

