//
//  ViewController.swift
//  RandomFactsApp
//
//  Created by Dmitry Cherkasov on 7/18/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        label.text = "Tap the brain to see some interesting fact"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func randomFact(_ sender: Any) {
        let factsArray = ["Ptenophobia is the fear of being tickled by feathers!",
                          "A flock of crows is known as a murder",
                          "Cherophobia is the fear of fun",
                          "An eagle can kill young deer and fly away with it.",
                          "Banging your head against a wall burns 150 calories an hour.",
                          "When hippos are upset their tears turns red",
                          "If your lift a kangoroo's tail off the ground it can't hop"]
        let randomFact = Int(arc4random_uniform(UInt32(factsArray.count)))
        label.text = factsArray[randomFact]
    }
}

