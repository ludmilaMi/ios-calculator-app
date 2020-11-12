//
//  GeneralTests.swift
//  ios-calculatorUITests
//
//  Created by Ludmila Miroshnichenko on 12/11/2020.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import XCTest

class GeneralTests: BaseTest {
    
    private let calculatorScreen = CalculatorScreen()
    
    func testAllNumberButtonsWork() {
        calculatorScreen
            .assertResult(number: "0")
            .inputNumber(number: "1234567890")
            .assertResult(number: "1,234,567,890")
    }
    
    func testVerifyNumberMaxLength() {
        //TODO: ask what the number max length is and then change the test assertion
        calculatorScreen
            .inputNumber(number: "832768265957684868768686876868")
            .assertResult(number: "832,768,265")
    }
    
    func testChangeOperationDuringCalculation() {
        calculatorScreen
            .inputNumber(number: "8")
            .multiply()
            .divide(byNumber: "2")
            .assertResult(number: "4")
    }
    
    func testResetButtonWorksWhenInterruptingCalculation() {
        calculatorScreen
            .inputNumber(number: "123")
            .reset()
            .inputNumber(number: "1")
            .add(number: "1")
            .assertResult(number: "2")
    }
    
    func testResetButtonWorksBeforeNextCalculation() {
        calculatorScreen
            .inputNumber(number: "100000")
            .add(number: "100000")
            .reset()
            .inputNumber(number: "99")
            .add(number: "2")
            .assertResult(number: "101")
    }
}
