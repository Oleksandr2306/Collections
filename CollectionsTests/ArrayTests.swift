//
//  ArrayTest.swift
//  CollectionsTests
//
//  Created by Oleksandr Melnyk on 22.08.2022.
//

import XCTest
@testable import Collections

final class ArrayTests: XCTestCase {

    private var sut: IntArrayManager!

    override func setUp() {
        sut = IntArrayManager()
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
    
    func test_appendThousandAtTheBeginning_oneByOne() throws {
        let expectation = expectation(description: "Thousand of elements appended")
        sut.createArray {
            self.sut.appendThousandAtTheBeginningOneByOne {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let expectedArraySize = self.sut.arraySize
                let expectedResult = 10_001_000
                XCTAssertEqual(expectedArraySize, expectedResult)
                XCTAssertEqual(self.sut.array[0], 999)
            }
        }
    }
    
    func test_appendThousandAtTheBeginning_atOnce() throws {
        let expectation = expectation(description: "Thousand of elements appended")
        sut.createArray {
            self.sut.appendThousandAtTheBeginningAtOnce {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let expectedArraySize = self.sut.arraySize
                let expectedResult = 10_001_000
                XCTAssertEqual(expectedArraySize, expectedResult)
                XCTAssertEqual(self.sut.array[0], 0)
            }
        }
    }
    
    func test_appendThousandInTheMiddle_oneByOne() throws {
        let expectation = expectation(description: "Thousand of elements appended")
        sut.createArray {
            self.sut.appendThousandInTheMiddleOneByOne {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let expectedArraySize = self.sut.arraySize
                let expectedResult = 10_001_000
                XCTAssertEqual(expectedArraySize, expectedResult)
                XCTAssertEqual(self.sut.array[self.sut.array.count / 2], 998)
            }
        }
    }
    
    func test_appendThousandInTheMiddle_atOnce() throws {
        let expectation = expectation(description: "Thousand of elements appended")
        sut.createArray {
            self.sut.appendThousandInTheMiddleAtOnce {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let expectedArraySize = self.sut.arraySize
                let expectedResult = 10_001_000
                XCTAssertEqual(expectedArraySize, expectedResult)
                XCTAssertEqual(self.sut.array[self.sut.array.count / 2], 500)
            }
        }
    }
    
    func test_appendThousandAtTheEnd_oneByOne() throws {
        let expectation = expectation(description: "Thousand of elements appended")
        sut.createArray {
            self.sut.appendThousandAtTheEndOneByOne {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let expectedArraySize = self.sut.arraySize
                let expectedResult = 10_001_000
                XCTAssertEqual(expectedArraySize, expectedResult)
                XCTAssertEqual(self.sut.array[self.sut.array.count - 1], 999)
            }
        }
    }
    
    func test_appendThousandAtTheEnd_atOnce() throws {
        let expectation = expectation(description: "Thousand of elements appended")
        sut.createArray {
            self.sut.appendThousandAtTheEndAtOnce {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let expectedArraySize = self.sut.arraySize
                let expectedResult = 10_001_000
                XCTAssertEqual(expectedArraySize, expectedResult)
                XCTAssertEqual(self.sut.array[self.sut.array.count - 1], 999)
            }
        }
    }
    
    func test_removeThousandAtTheBeginning_oneByOne() throws {
        let expectation = expectation(description: "Thousand of elements removed")
        sut.createArray {
            self.sut.removeThousandAtTheBeginningOneByOne {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let expectedArraySize = self.sut.arraySize
                let expectedResult = 9_999_000
                XCTAssertEqual(expectedArraySize, expectedResult)
                XCTAssertEqual(self.sut.array[0], 1000)
            }
        }
    }
    
    func test_removeThousandAtTheBeginning_atOnce() throws {
        let expectation = expectation(description: "Thousand of elements removed")
        sut.createArray {
            self.sut.removeThousandAtTheBeginningAtOnce {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let expectedArraySize = self.sut.arraySize
                let expectedResult = 9_999_000
                XCTAssertEqual(expectedArraySize, expectedResult)
                XCTAssertEqual(self.sut.array[0], 1000)
            }
        }
    }
    
    func test_removeThousandInTheMiddle_oneByOne() throws {
        let expectation = expectation(description: "Thousand of elements removed")
        sut.createArray {
            self.sut.removeThousandInTheMiddleOneByOne {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let expectedArraySize = self.sut.arraySize
                let expectedResult = 9_999_000
                XCTAssertEqual(expectedArraySize, expectedResult)
                XCTAssertEqual(self.sut.array[self.sut.array.count / 2], 5000500)
            }
        }
    }
    
    func test_removeThousandInTheMiddle_atOnce() throws {
        let expectation = expectation(description: "Thousand of elements removed")
        sut.createArray {
            self.sut.removeThousandInTheMiddleAtOnce {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let expectedArraySize = self.sut.arraySize
                let expectedResult = 9_999_000
                XCTAssertEqual(expectedArraySize, expectedResult)
                XCTAssertEqual(self.sut.array[self.sut.array.count / 2], 5000500)
            }
        }
    }
    
    func test_removeThousandAtTheEnd_oneByOne() throws {
        let expectation = expectation(description: "Thousand of elements removed")
        sut.createArray {
            self.sut.removeThousandAtTheEndOneByOne {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let expectedArraySize = self.sut.arraySize
                let expectedResult = 9_999_000
                XCTAssertEqual(expectedArraySize, expectedResult)
                XCTAssertEqual(self.sut.array[self.sut.array.count - 1], 9_998_999)
            }
        }
    }
    
    func test_removeThousandAtTheEnd_atOnce() throws {
        let expectation = expectation(description: "Thousand of elements removed")
        sut.createArray {
            self.sut.removeThousandAtTheEndAtOnce {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10.0) { error in
            if error != nil {
                XCTFail()
            } else {
                let expectedArraySize = self.sut.arraySize
                let expectedResult = 9_999_000
                XCTAssertEqual(expectedArraySize, expectedResult)
                XCTAssertEqual(self.sut.array[self.sut.array.count - 1], 9_998_999)
            }
        }
    }
}

