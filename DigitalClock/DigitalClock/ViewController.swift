//
//  ViewController.swift
//  DigitalClock
//
//  Created by Dmitry Cherkasov on 7/18/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var colorPanel: UISegmentedControl!
    @IBOutlet weak var background: UISegmentedControl!
    @IBOutlet weak var settings: UIButton!
    
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        settingsView.isHidden = true
        settings.alpha = 0.25
        label.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTimer() {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .medium
        label.text = timeFormatter.string(from: Date())
        label.alpha = 1
        settingsView.layer.cornerRadius = 5
        settings.layer.cornerRadius = 5
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        if settingsView.isHidden {
            settingsView.isHidden = false
            settings.setTitle("Hide Settings", for: [])
            settings.alpha = 1.0
        } else {
            settingsView.isHidden = true
            settings.setTitle("Show Settings", for: [])
            settings.alpha = 0.25
        }
    }
    
    @IBAction func textColor(_ sender: Any) {
        if colorPanel.selectedSegmentIndex == 0 {
            label.textColor = UIColor.white
        } else if colorPanel.selectedSegmentIndex == 1 {
            label.textColor = UIColor.black
        } else if colorPanel.selectedSegmentIndex == 2 {
            label.textColor = UIColor.red
        } else if colorPanel.selectedSegmentIndex == 3 {
            label.textColor = UIColor.green
        }
    }

    @IBAction func backgorundColor(_ sender: Any) {
        if background.selectedSegmentIndex == 0 {
            label.backgroundColor = UIColor.black
        } else if background.selectedSegmentIndex == 1 {
            label.backgroundColor = UIColor.white
        } else if background.selectedSegmentIndex == 2 {
            label.backgroundColor = UIColor.yellow
        } else if background.selectedSegmentIndex == 3 {
            label.backgroundColor = UIColor.blue
        }
    }

}

