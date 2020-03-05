//
//  ViewController.swift
//  brainGame
//
//  Created by XIN on 2/20/20.
//  Copyright © 2020 XIN. All rights reserved.
//

import UIKit
var time = 10
var timer1 = Timer()

class ViewController: UIViewController {
    
    var score1 = 0
    
    
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var topCardView: UILabel!
    @IBOutlet weak var bottomCardView: UILabel!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    
    var topTextColor = Color ()
    var bottomCardColor = Color ()
    
    var score: Int = 0 {
        didSet {
            scoreLabel.text = String(score)
        }
    }
    
    @objc func action() {
        if time != 0 {
            time -= 1
            timer.text = "Timer: \(String(time))"
        }else {
            
            timer1.invalidate()
            performSegue(withIdentifier: "toResults", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ResultViewController{
            destination.expectScore = score1
            
        }
    }
    
    func checkAnswer(yesTapped:Bool) {
        var colorsMatch = true
        
        if topTextColor == bottomCardColor{
            colorsMatch = true
        }else {
            colorsMatch = false
        }
        
        if yesTapped && colorsMatch {
            score1 += 1
        } else if yesTapped && !colorsMatch{
            score1 -= 1
        } else if !yesTapped && !colorsMatch {
            score1 += 1
        } else if !yesTapped && colorsMatch {
            score1 -= 1
        }
        
        scoreLabel.text = "Score: \(score1)"
        
        topTextColor.getRandomOption()
        bottomCardColor.getRandomOption()
        
        topCardView.text = topTextColor.text
        bottomCardView.text = Color().text
        
        bottomCardView.textColor = bottomCardColor.textColor
    }
    
    @IBAction func noButtonTapped(_ sender: Any){
        checkAnswer(yesTapped: false)
    }
    
    @IBAction func yesButtonTapped(_ sender: Any){
        checkAnswer(yesTapped: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topCardView.text = topTextColor.text
        bottomCardView.text = Color().text
        
        bottomCardView.textColor = bottomCardColor.textColor
        
        timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        
    }

}
