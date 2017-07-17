//
//  ViewController.swift
//  TrafficLightsApp
//
//  Created by Dmitry Cherkasov on 7/17/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trafficLight: UIImageView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var startStop: UIButton!
    
    var timer = Timer()
    var scoreTimer = Timer()
    var timerInt = 0
    var scoreInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scoreInt = 0
        counterLabel.text = String(scoreInt)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startStopButton(_ sender: Any) {
        if scoreInt == 0 {
            timerInt = 3
            trafficLight.image = UIImage(named: "TrafficLight")
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
            startStop.isEnabled = false
            startStop.setTitle("", for: [])
            scoreInt = 0
            counterLabel.text = String(scoreInt)
        } else {
            scoreTimer.invalidate()
        }
        
        if timerInt == 0 {
            scoreInt = 0
            startStop.setTitle("Restart", for: [])
            
        }
    }
    
    func updateCounter() {
        timerInt -= 1
        if timerInt == 2 {
            trafficLight.image = UIImage(named: "TrafficLight3")
        } else if  timerInt == 1 {
            trafficLight.image = UIImage(named: "TrafficLight2")
            startStop.setTitle("Stop", for: [])
        } else if timerInt == 0 {
            trafficLight.image = UIImage(named: "TrafficLight1")
            timer.invalidate()
            startStop.isEnabled = true
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(ViewController.updateScoreTimer), userInfo: nil, repeats: true)
        }
    }
    
    func updateScoreTimer() {
        scoreInt += 1
        counterLabel.text = String(scoreInt)
    }

}

