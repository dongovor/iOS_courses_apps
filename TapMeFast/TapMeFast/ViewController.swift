//
//  ViewController.swift
//  TapMeFast
//
//  Created by Dmitry Cherkasov on 7/18/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var tapMe: UIButton!
    @IBOutlet weak var startGame: UIButton!
    
    var timer = Timer()
    var timeInt = 0
    var tapInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeInt = 10
        tapInt = 0
        timerLabel.text = String(timeInt)
        scoreLabel.text = String(tapInt)
        tapMe.isEnabled = false
        tapMe.alpha = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapMeButton(_ sender: Any) {
        tapInt += 1
        scoreLabel.text = String(tapInt)
        
    }
    
    @IBAction func startGameButton(_ sender: Any) {
        if timeInt == 10 {
            tapInt = 0
            scoreLabel.text = String(tapInt)
            tapMe.isEnabled = true
            tapMe.alpha = 1
            startGame.isEnabled = false
            startGame.alpha = 0.5
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.startCounter), userInfo: nil, repeats: true)
        }
        
        if timeInt == 0 {
            timeInt = 10
            tapInt = 0
            timerLabel.text = String(timeInt)
            scoreLabel.text = String(tapInt)
            startGame.setTitle("START GAME", for: [])
        }
    }
    
    func startCounter() {
        timeInt -= 1
        timerLabel.text = String(timeInt)
        
        if timeInt == 0 {
            timer.invalidate()
            tapMe.isEnabled = false
            tapMe.alpha = 0.5
            startGame.isEnabled = true
            startGame.alpha = 1
            startGame.setTitle("RESTART", for: [])
            
        }
    }

}

