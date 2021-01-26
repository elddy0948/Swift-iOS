//
//  CryptoCurrencyAPIPracticeTests.swift
//  CryptoCurrencyAPIPracticeTests
//
//  Created by 김호준 on 2021/01/26.
//

import XCTest
@testable import CryptoCurrencyAPIPractice

class CryptoCurrencyAPIPracticeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //CurrencyData Model에 대한 테스트
    func test_currency_data_model() {
        guard let bundleURL = Bundle.main.url(forResource: "LatestMock", withExtension: "json") else {
            XCTFail()
            return
        }
        do {
            let latestCurrencyData = try Data(contentsOf: bundleURL)
            let json = try JSONDecoder().decode(CurrencyData.self
                                                , from: latestCurrencyData)
            XCTAssertNotNil(json.cryptoData)
            XCTAssertEqual(json.cryptoData?[0].name, "Bitcoin")
        } catch {
            XCTFail()
            return
        }
    }
}
