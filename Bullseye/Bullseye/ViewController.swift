//
//  ViewController.swift
//  Bullseye
//
//  Created by cs laptop on 9/4/16.
//  Copyright © 2016 Daniel King. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        score += points
        let message = "You scored \(points) points!"
        
        let alert = UIAlertController(title: "Hello, World",
                                      message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default,
                                   handler: { action in
                                    self.startNewRound()
                                    self.updateLabels()
        })
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver() {
        score = 0
        round = 0
        startNewRound()
        updateLabels()
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

