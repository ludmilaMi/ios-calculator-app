//
//  BaseTest.swift
//  ios-calculatorUITests
//
//  Created by Ludmila Miroshnichenko on 12/11/2020.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import XCTest

class BaseTest : XCTestCase {
    
    var app = XCUIApplication()
    
    open override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    open override func tearDown() {
        app.terminate()
        super.tearDown()
    }
}
