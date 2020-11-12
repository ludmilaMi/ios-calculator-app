//
//  CalculatorScreen.swift
//  ios-calculatorUITests
//
//  Created by Ludmila Miroshnichenko on 12/11/2020.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import XCTest

class CalculatorScreen: BaseTest {
    
    private lazy var plusButton = app.buttons["+"].firstMatch
    private lazy var minusButton = app.buttons["-"].firstMatch
    private lazy var multiplyButton = app.buttons["x"].firstMatch
    private lazy var divideButton = app.buttons["/"].firstMatch
    
    private lazy var resetButton = app.buttons["C"].firstMatch
    private lazy var plusMinusButton = app.buttons["+/-"].firstMatch
    private lazy var percentButton = app.buttons["%"].firstMatch
    private lazy var equalsButton = app.buttons["="].firstMatch
    
    var resultNumber: String? {
        return app.staticTexts.firstMatch.label
    }
    
    func inputNumber(number: String) -> CalculatorScreen {
        for x in number {
            app.buttons[String(x)].tap()
        }
        return self
    }
    
    func changeSign() -> CalculatorScreen {
        plusMinusButton.tap()
        return self
    }
    
    func reset() -> CalculatorScreen {
        resetButton.tap()
        return self
    }
    
    func showResult() -> CalculatorScreen {
        equalsButton.tap()
        return self
    }
    
    func add(number: String) -> CalculatorScreen {
        plusButton.tap()
        inputNumber(number: number)
        showResult()
        return self
    }
    
    func add() -> CalculatorScreen {
        plusButton.tap()
        return self
    }
    
    func subtract(number: String) -> CalculatorScreen {
        minusButton.tap()
        inputNumber(number: number)
        showResult()
        return self
    }
    
    func subtract() -> CalculatorScreen {
        minusButton.tap()
        return self
    }

    func multiply(byNumber: String) -> CalculatorScreen {
        multiplyButton.tap()
        inputNumber(number: byNumber)
        showResult()
        return self
    }
    
    func multiply() -> CalculatorScreen {
        multiplyButton.tap()
        return self
    }
    
    func divide(byNumber: String) -> CalculatorScreen {
        divideButton.tap()
        inputNumber(number: byNumber)
        showResult()
        return self
    }
    
    func divide() -> CalculatorScreen {
        divideButton.tap()
        return self
    }
    
    func assertResult(number: String) -> CalculatorScreen {
        XCTAssertTrue(resultNumber! == number, "Result number is not correct")
        return self
    }
}
