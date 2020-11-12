//
//  MultiplicationTests.swift
//  ios-calculatorUITests
//
//  Created by Ludmila Miroshnichenko on 12/11/2020.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import XCTest

class MultiplicationTests : BaseTest {
    
    private let calculatorScreen = CalculatorScreen()
    
    func testMultiplySmallIntegers() {
        calculatorScreen
            .inputNumber(number: "2")
            .multiply(byNumber: "5")
            .assertResult(number: "10")
    }
    
    func testMultiplyBigIntegers() {
        calculatorScreen
            .inputNumber(number: "999999")
            .multiply(byNumber: "222222")
            .assertResult(number: "222,221,777,778")
    }
    
    func testMultiplyBySmallDoubleNumberAndCheckRounding() {
        calculatorScreen
            .inputNumber(number: "50")
            .multiply(byNumber: "0,02")
            .assertResult(number: "1")
    }
    
    func testMultiplyBigDoubleNumbers() {
        calculatorScreen
            .inputNumber(number: "5678,000003")
            .multiply(byNumber: "1234,00007")
            .assertResult(number: "7006652,401162")
    }
    
    func testMultiplySmallNegativeNumbers() {
        calculatorScreen
            .inputNumber(number: "2")
            .changeSign()
            .multiply()
            .inputNumber(number: "50")
            .changeSign()
            .showResult()
            .assertResult(number: "-100")
        
    }
    
    func testMultiplyByBigNegativeNumber() {
        calculatorScreen
            .inputNumber(number: "5")
            .multiply()
            .inputNumber(number: "20000")
            .changeSign()
            .showResult()
            .assertResult(number: "-100,000")
    }
    
    func testMultiplySeveralNumbersOfDifferentTypes() {
        calculatorScreen
            .inputNumber(number: "1")
            .multiply()
            .inputNumber(number: "25")
            .changeSign()
            .multiply()
            .inputNumber(number: "0,00001")
            .multiply()
            .inputNumber(number: "1000000")
            .showResult()
            .assertResult(number: "-250")
    }
    
    func testMultiplyByZero() {
        calculatorScreen
            .inputNumber(number: "10,01")
            .multiply(byNumber: "0")
            .assertResult(number: "0")
    }
}
