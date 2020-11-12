//
//  AdditionTests.swift
//  ios-calculatorUITests
//
//  Created by Ludmila Miroshnichenko on 12/11/2020.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import XCTest

class AdditionTests : BaseTest {
    
    private let calculatorScreen = CalculatorScreen()
    
    func testAddSmallIntegers() {
        calculatorScreen
            .inputNumber(number: "1")
            .add(number: "9")
            .assertResult(number: "10")
    }
    
    func testAddBigIntegers() {
        //The result of the calculation is a number of type long. What should be the app behaviour in this case?
        calculatorScreen
            .inputNumber(number: "1147483647")
            .add(number: "1147483647")
            .assertResult(number: "2,294,967,294")
    }
    
    func testAddSmallDoubleNumbersAndCheckRounding() {
        calculatorScreen
            .inputNumber(number: "0,00005")
            .add(number: "1,99995")
            .assertResult(number: "2")
    }
    
    func testAddBigDoubleNumbers() {
        calculatorScreen
            .inputNumber(number: "9999999,03")
            .add(number: "2222222,08")
            .assertResult(number: "12222221,11")
    }
    
    func testAddSmallNegativeNumbers() {
        calculatorScreen
            .inputNumber(number: "7")
            .changeSign() //a number should be negative after this action
            .add()
            .inputNumber(number: "3")
            .changeSign() //a second number should also be negative after this action
            .showResult()
            .assertResult(number: "-10")
    }
    
    func testAddBigNegativeNumbers() {
        calculatorScreen
            .inputNumber(number: "1147483647")
            .changeSign()
            .add()
            .inputNumber(number: "1147483647")
            .changeSign()
            .showResult()
            .assertResult(number: "-2,294,967,294")
    }
    
    func testAddSeveralNumbersOfDifferentTypes() {
        calculatorScreen
            .inputNumber(number: "1")
            .add()
            .inputNumber(number: "1,002")
            .add()
            .inputNumber(number: "0,008")
            .changeSign()
            .add()
            .inputNumber(number: "999")
            .changeSign()
            .showResult()
            .assertResult(number: "-997,006")
    }
}
