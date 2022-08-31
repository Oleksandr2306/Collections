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
        sut.createArray {
            let result = self.sut.getSize()
            let expectedResult = 10_000_000
            XCTAssertEqual(result, expectedResult)
        }
    }
    
    func test_appendThousandAtTheBeginning_oneByOne() throws {
        sut.createArray {
            self.sut.appendThousandAtTheBeginningOneByOne {
                let result = self.sut.getSize()
                let expectedResult = 10_001_000
                XCTAssertEqual(result, expectedResult)
            }
        }
    }
    
    func test_appendThousandAtTheBeginning_atOnce() throws {
        sut.createArray {
            self.sut.appendThousandAtTheBeginningAtOnce() {
                let result = self.sut.getSize()
                let expectedResult = 10_001_000
                XCTAssertEqual(result, expectedResult)
            }
        }
    }
    
    func test_appendThousandInTheMiddle_oneByOne() throws {
        sut.createArray {
            self.sut.appendThousandInTheMiddleOneByOne {
                let result = self.sut.getSize()
                let expectedResult = 10_001_000
                XCTAssertEqual(result, expectedResult)
            }
        }
    }
    
    func test_appendThousandInTheMiddle_atOnce() throws {
        sut.createArray {
            self.sut.appendThousandInTheMiddleAtOnce {
                let result = self.sut.getSize()
                let expectedResult = 10_001_000
                XCTAssertEqual(result, expectedResult)
            }
        }
    }
    
    func test_appendThousandAtTheEnd_oneByOne() throws {
        sut.createArray {
            self.sut.appendThousandAtTheEndOneByOne {
                let result = self.sut.getSize()
                let expectedResult = 10_001_000
                XCTAssertEqual(result, expectedResult)
            }
        }
    }
    
    func test_appendThousandAtTheEnd_atOnce() throws {
        sut.createArray {
            self.sut.appendThousandAtTheEndAtOnce {
                let result = self.sut.getSize()
                let expectedResult = 10_001_000
                XCTAssertEqual(result, expectedResult)
            }
        }
    }
    
    func test_removeThousandAtTheBeginning_oneByOne() throws {
        sut.createArray {
            self.sut.removeThousandAtTheBeginningOneByOne {
                let result = self.sut.getSize()
                let expectedResult = 99_999_000
                XCTAssertEqual(result, expectedResult)
            }
        }
    }
    
    func test_removeThousandAtTheBeginning_atOnce() throws {
        sut.createArray {
            self.sut.removeThousandAtTheBeginningAtOnce {
                let result = self.sut.getSize()
                let expectedResult = 99_999_000
                XCTAssertEqual(result, expectedResult)
            }
        }
    }
    
    func test_removeThousandInTheMiddle_oneByOne() throws {
        sut.createArray {
            self.sut.removeThousandInTheMiddleOneByOne {
                let result = self.sut.getSize()
                let expectedResult = 99_999_000
                XCTAssertEqual(result, expectedResult)
            }
        }
    }
    
    func test_removeThousandInTheMiddle_atOnce() throws {
        sut.createArray {
            self.sut.removeThousandInTheMiddleAtOnce {
                let result = self.sut.getSize()
                let expectedResult = 99_999_000
                XCTAssertEqual(result, expectedResult)
            }
        }
    }
    
    func test_removeThousandAtTheEnd_oneByOne() throws {
        sut.createArray {
            self.sut.removeThousandAtTheEndOneByOne {
                let result = self.sut.getSize()
                let expectedResult = 99_999_000
                XCTAssertEqual(result, expectedResult)
            }
        }
    }
    
    func test_removeThousandAtTheEnd_atOnce() throws {
        sut.createArray {
            self.sut.removeThousandAtTheEndAtOnce {
                let result = self.sut.getSize()
                let expectedResult = 99_999_000
                XCTAssertEqual(result, expectedResult)
            }
        }
    }
}

