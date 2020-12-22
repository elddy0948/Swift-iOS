//
//  File.swift
//  
//
//  Created by 김호준 on 2020/12/16.
//

import XCTest
import UnitTestPractice

final class IntOrDoubleTests: XCTestCase {
    func test_FloatingPoint() throws {
        let onePointFive = try XCTUnwrap(1.5.isInteger)
        let onePointZero = try XCTUnwrap(1.0.isInteger)
        XCTAssertTrue(onePointZero)
        XCTAssertFalse(onePointFive)
        XCTAssertNil(0.0.isInteger)
        XCTFail()
    }
}
