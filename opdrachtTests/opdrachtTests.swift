//
//  opdrachtTests.swift
//  opdrachtTests
//
//  Created by Tim Hoogstrate on 28/01/2020.
//  Copyright © 2020 Tim Hoogstrate. All rights reserved.
//

import XCTest
@testable import opdracht

class opdrachtTests: XCTestCase {

    override func setUp() {
        testParseCities()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParseCities() {
        
        //basic simple test
        CityService.init().requestCities { (cities, error) in
            XCTAssert((cities as Any) is [City])
        }
    }
}
