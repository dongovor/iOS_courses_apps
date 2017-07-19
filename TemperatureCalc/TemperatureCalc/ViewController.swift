//
//  ViewController.swift
//  TemperatureCalc
//
//  Created by Dmitry Cherkasov on 7/19/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterTempLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var segmentChanger: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func calculate(_ sender: Any) {
        
                if segmentChanger.selectedSegmentIndex == 0 {
                    let fahrenheit = Double(textField.text!)
                    let celsius = (fahrenheit! - 32) / 1.8
                    let result = String(format: "%4.1f celsius", celsius)
                    outputLabel.text = result
        
                    if celsius > 120 {
                        imageView.image = UIImage(named: "Temp9.png")
                    } else if celsius > 100 {
                        imageView.image = UIImage(named: "Temp8.png")
                    } else if celsius > 80 {
                        imageView.image = UIImage(named: "Temp7.png")
                    } else if celsius > 60 {
                        imageView.image = UIImage(named: "Temp6.png")
                    } else if celsius > 40 {
                        imageView.image = UIImage(named: "Temp5.png")
                    } else if celsius > 20 {
                        imageView.image = UIImage(named: "Temp4.png")
                    } else if celsius > 0 {
                        imageView.image = UIImage(named: "Temp3.png")
                    } else if celsius > -20 {
                        imageView.image = UIImage(named: "Temp2.png")
                    } else if celsius < -20 {
                        imageView.image = UIImage(named: "Temp1.png")
                    }
                }
        
                if segmentChanger.selectedSegmentIndex == 1 {
                    let celsius = Double(textField.text!)
                    let fahrenheit = (celsius! * 1.8) + 32
                    let result = String(format: "%4.1f fahrenheit", fahrenheit)
                    outputLabel.text = result
        
                    if fahrenheit > 160 {
                        imageView.image = UIImage(named: "Temp9.png")
                    } else if fahrenheit > 140 {
                        imageView.image = UIImage(named: "Temp8.png")
                    } else if fahrenheit > 120 {
                        imageView.image = UIImage(named: "Temp7.png")
                    } else if fahrenheit > 100 {
                        imageView.image = UIImage(named: "Temp6.png")
                    } else if fahrenheit > 80 {
                        imageView.image = UIImage(named: "Temp5.png")
                    } else if fahrenheit > 60 {
                        imageView.image = UIImage(named: "Temp4.png")
                    } else if fahrenheit > 40 {
                        imageView.image = UIImage(named: "Temp3.png")
                    } else if fahrenheit > 20 {
                        imageView.image = UIImage(named: "Temp2.png")
                    } else if fahrenheit < 20 {
                        imageView.image = UIImage(named: "Temp1.png")
                    }
                }
        
        self.resignFirstResponder()
    }

    @IBAction func changeCalculation(_ sender: Any) {
        if segmentChanger.selectedSegmentIndex == 0 {
            enterTempLabel.text = "Enter Fahrenheit"
            textField.text = ""
            outputLabel.text = "0 Celsius"
        } else if segmentChanger.selectedSegmentIndex == 1 {
            enterTempLabel.text = "Enter Celsius"
            textField.text = ""
            outputLabel.text = "0 Fahrenheit"
        }
    }
}

