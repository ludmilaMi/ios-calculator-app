//
//  ViewController.swift
//  ios-calculator
//
//  Created by Enjelina on 03/03/20.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import UIKit

// MARK: - Enums
enum modes {
    case notSet
    case addition
    case substraction
    case multiplication
}

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Vars
    var labelString: String = "0"
    var currentMode: modes = .notSet
    var savedNum: Int = 0
    var lastButtonWasMode: Bool = false
    
    // MARK: - Funcs
    func updateText() {
        guard let labelInt: Int = Int(labelString) else {
            label.text = "Error"
            return
        }
        label.text = "\(labelInt)"
    
    }
    
    func changeModes(newMode: modes) {
        
    }

    
    @IBAction func didPressPlus(_ sender: Any) {
    }
    
    @IBAction func didPressMinus(_ sender: Any) {
    }
    
    @IBAction func didPressEquals(_ sender: Any) {
    }
    
    
    @IBAction func didPressClear(_ sender: Any) {
        labelString = "0"
        currentMode = .notSet
        savedNum = 0
        lastButtonWasMode = false
        label.text = "0"
    }
    
    
    @IBAction func didPressNumber(_ sender: UIButton) {
        guard let stringValue: String = sender.titleLabel?.text else {
            label.text = "Error"
            return
        }
        labelString = labelString.appending(stringValue)
        updateText()
    }
    
    
    
}

