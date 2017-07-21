//
//  ViewController.swift
//  SimonSaysGame
//
//  Created by Dmitry Cherkasov on 7/20/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    
    var timeInt = 0
    var scoreInt = 0
    var modeInt = 0
    var timer = Timer()
    var simonTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.layer.cornerRadius = 25
        label.clipsToBounds = true
        
        timeInt = 20
        scoreInt = 0
        modeInt = 0
        
        timeLabel.text = String("Time: \(timeInt)")
        scoreLabel.text = String("Score: \(scoreInt)")
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGestures))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGestures))
        swipeRight.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGestures))
        swipeRight.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGestures))
        swipeRight.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame(_ sender: Any) {
        if timeInt == 20 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
            modeInt = 1
         
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.25
            
            self.simonSays()
        }
        if timeInt == 0 {
            timeInt = 20
            scoreInt = 0
            
            timeLabel.text = String("Time: \(timeInt)")
            scoreLabel.text = String("Score: \(scoreInt)")
            
            label.text = "Simon Says"
            
            startGameButton.setTitle("Start Game", for: .normal)
        }
    }
    
    func updateTimer() {
        timeInt -= 1
        timeLabel.text = String("Time: \(timeInt)")
        if timeInt == 0 {
            timer.invalidate()
            simonTimer.invalidate()
            label.text = "Game Over"
            modeInt = 0
            startGameButton.isEnabled = true
            startGameButton.alpha = 1
            startGameButton.setTitle("Restart", for: .normal)
        }
    }
    
    func simonSays() {
        let arr = ["Simon Says Swipe Right",
                   "Swipe Right",
                   "Simon Says Swipe Left",
                   "Swipe Left",
                   "Simon Says Swipe Up",
                   "Swipe Up",
                   "Simon Says Swipe Down",
                   "Swipe Down"]
        let randomSwipe = Int(arc4random_uniform(UInt32(arr.count)))
        label.text = arr[randomSwipe]
        simonTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.simonSays), userInfo: nil, repeats: false)
    }
    
    func swipeGestures(sender: UISwipeGestureRecognizer) {
        if modeInt == 1 {
            if sender.direction == .right {
                simonTimer.invalidate()
                if label.text == "Simon Says Swipe Right" {
                    
                    scoreInt += 1
                    scoreLabel.text = String("Score: \(scoreInt)")
                    
                    self.simonSays()
                }
            } else {
                scoreInt -= 1
                scoreLabel.text = String("Score: \(scoreInt)")
                self.simonSays()
            }
            
            if sender.direction == .left {
                simonTimer.invalidate()
                if label.text == "Simon Says Swipe Left" {
                    scoreInt += 1
                    scoreLabel.text = String("Score: \(scoreInt)")
                    self.simonSays()
                }
            } else {
                scoreInt -= 1
                scoreLabel.text = String("Score: \(scoreInt)")
                self.simonSays()
            }
            
            if sender.direction == .up {
                simonTimer.invalidate()
                if label.text == "Simon Says Swipe Up" {
                    scoreInt += 1
                    scoreLabel.text = String("Score: \(scoreInt)")
                    self.simonSays()
            } else {
                scoreInt -= 1
                scoreLabel.text = String("Score: \(scoreInt)")
                self.simonSays()
            }
            if sender.direction == .down {
                simonTimer.invalidate()
                if label.text == "Simon Says Swipe Down" {
                    scoreInt += 1
                    scoreLabel.text = String("Score: \(scoreInt)")
                    self.simonSays()
            } else {
                scoreInt -= 1
                scoreLabel.text = String("Score: \(scoreInt)")
                self.simonSays()
            }
            }
        }
        }
    }
}







