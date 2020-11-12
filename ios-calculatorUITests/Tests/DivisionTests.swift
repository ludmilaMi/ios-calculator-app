//
//  DivisionTests.swift
//  ios-calculatorUITests
//
//  Created by Ludmila Miroshnichenko on 12/11/2020.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import XCTest

class DivisionTests : BaseTest {
    
    private let calculatorScreen = CalculatorScreen()
    
    func testDivideBySmallInteger() {
        calculatorScreen
            .inputNumber(number: "100")
            .divide(byNumber: "2")
            .assertResult(number: "50")
    }
    
    func testDivideByBigInteger() {
        calculatorScreen
            .inputNumber(number: "10")
            .divide(byNumber: "1000000")
            .assertResult(number: "0,00001")
    }
    
    func testDivideBySmallDoubleNumberAndCheckRounding() {
        calculatorScreen
            .inputNumber(number: "1000")
            .divide(byNumber: "0,5")
            .assertResult(number: "2,000")
    }
    
    func testDivideByBigDoubleNumber() {
        calculatorScreen
            .inputNumber(number: "9999999")
            .divide(byNumber: "1000000,5")
            .assertResult(number: "9,999994")
    }
    
    func testDivideBySmallNegativeNumber() {
        calculatorScreen
            .inputNumber(number: "99999")
            .divide()
            .inputNumber(number: "33")
            .changeSign()
            .showResult()
            .assertResult(number: "-3030,272727")
    }
    
    func testDivideByBigNegativeNumber() {
        calculatorScreen
            .inputNumber(number: "99999")
            .divide()
            .inputNumber(number: "33333")
            .changeSign()
            .showResult()
            .assertResult(number: "-3")
    }
    
    func testDivideBySeveralNumbersOfDifferentTypes() {
        calculatorScreen
            .inputNumber(number: "1000000")
            .divide()
            .inputNumber(number: "0,002")
            .changeSign()
            .divide()
            .inputNumber(number: "2")
            .changeSign()
            .showResult()
            .assertResult(number: "250,000,000")
    }
}
