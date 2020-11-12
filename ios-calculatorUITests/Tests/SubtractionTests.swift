//
//  SubtractionTests.swift
//  ios-calculatorUITests
//
//  Created by Ludmila Miroshnichenko on 12/11/2020.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import XCTest

class SubtractionTests: BaseTest {
    
    private let calculatorScreen = CalculatorScreen()
    
    func testSubtractSmallInteger() {
        calculatorScreen
            .inputNumber(number: "10")
            .subtract(number: "1")
            .assertResult(number: "9")
    }
    
    func testSubtractBigInteger() {
        calculatorScreen
            .inputNumber(number: "10000000")
            .subtract(number: "1000000")
            .assertResult(number: "9,000,000")
    }
    
    func testSubtractSmallDoubleNumberAndCheckRounding() {
        calculatorScreen
            .inputNumber(number: "1,0005")
            .subtract(number: "0,0005")
            .assertResult(number: "1")
    }
    
    func testSubtractBigDoubleNumberToGetNegativeResult() {
        calculatorScreen
            .inputNumber(number: "99999,99")
            .subtract(number: "999999,99")
            .assertResult(number: "-900,000")
    }
    
    func testSubtractSmallNegativeNumber() {
        calculatorScreen
            .inputNumber(number: "1")
            .subtract()
            .inputNumber(number: "1")
            .changeSign()
            .showResult()
            .assertResult(number: "2")
    }
    
    func testSubtractBigNegativeNumber() {
        calculatorScreen
            .inputNumber(number: "1000000")
            .changeSign()
            .subtract()
            .inputNumber(number: "999999")
            .changeSign()
            .showResult()
            .assertResult(number: "-1")
    }
    
    func testSubtractSeveralNumbersOfDifferentTypes() {
        calculatorScreen
            .inputNumber(number: "100")
            .subtract()
            .inputNumber(number: "100")
            .subtract()
            .inputNumber(number: "0,1")
            .changeSign()
            .subtract()
            .inputNumber(number: "0,1")
            .showResult()
            .assertResult(number: "0")
    }
}
