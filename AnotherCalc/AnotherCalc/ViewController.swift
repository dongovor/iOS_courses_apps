//
//  ViewController.swift
//  AnotherCalc
//
//  Created by Dmitry Cherkasov on 7/20/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var isFirstDigit = true
    var operationOne: Double = 0
    var operationTwo = "="
    var displayValue: Double {
        get {
            return NumberFormatter().number(from: label.text!)!.doubleValue
        }
        set {
            label.text = String(format: "%2.0f", newValue)
            isFirstDigit = true
            operationTwo = "="
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func digitPressed(_ sender: AnyObject) {
        let digit = sender.currentTitle!
        label.text = isFirstDigit ? digit : label.text! + digit!
        isFirstDigit = false
        
    }
    
    @IBAction func cancelButton(_ sender: AnyObject) {
        displayValue = 0
    }
    
    @IBAction func calculateButton(_ sender: AnyObject) {
        switch operationTwo {
            case "/": displayValue = operationOne / displayValue
            case "*": displayValue *= operationOne
            case "+": displayValue += operationOne
            case "-": displayValue = operationOne - displayValue
        
        default:
            break
        }
    }
    
    @IBAction func operationButton(_ sender: AnyObject) {
        operationTwo = sender.currentTitle!!
        operationOne = displayValue
        isFirstDigit = true
    }

}

