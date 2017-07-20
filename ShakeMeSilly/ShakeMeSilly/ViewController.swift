//
//  ViewController.swift
//  ShakeMeSilly
//
//  Created by Dmitry Cherkasov on 7/20/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startRestartButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var timer = Timer()
    var countInt = 0
    var scoreInt = 0
    var modeInt = 0
    var imageInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startRestartButton.layer.cornerRadius = 15
        countInt = 10
        scoreInt = 0
        timerLabel.text = String(countInt)
        scoreLabel.text = String(scoreInt)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func countdown() {
        countInt -= 1
        timerLabel.text = String(countInt)
        
        if countInt == 0 {
            timer.invalidate()
            startRestartButton.isEnabled = true
            startRestartButton.alpha = 1
            startRestartButton.setTitle("Restart Game", for: [])
            modeInt = 0
        }
    }
    
    @IBAction func startGame(_ sender: Any) {
        if countInt == 10 {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true)
            startRestartButton.isEnabled = false
            startRestartButton.alpha = 0.5
            modeInt = 1
        }
        
        if countInt == 0 {
            scoreInt = 0
            countInt = 10
            timerLabel.text = String(countInt)
            scoreLabel.text = String(scoreInt)
            startRestartButton.setTitle("Start Game", for: [])
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if modeInt == 1 {
                scoreInt += 1
                scoreLabel.text = String(scoreInt)
                imageInt += 1
                
                if imageInt == 5 {
                    imageInt = 1
                }
                
                imageView.image = UIImage(named: "Maracas\(imageInt).png")
            }
        }
    }
}

