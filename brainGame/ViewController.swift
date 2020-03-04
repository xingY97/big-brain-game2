//
//  ViewController.swift
//  brainGame
//
//  Created by XIN on 2/20/20.
//  Copyright © 2020 XIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var time = 60
    var timer1 = Timer()
    var score1 = 0
    
    
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var pauseLabel: UIButton!
    @IBOutlet weak var topCardView: UILabel!
    @IBOutlet weak var bottomCardView: UILabel!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    
    var topTextColor = Color ()
    var bottomTextColor = Color ()
    
    @objc func action() {
        if time != 0 {
            time -= 1
            timer.text = "Timer: \(String(time))"
        }else {
            time = 60
            timer1.invalidate()
            performSegue(withIdentifier: "toResults", sender: score1)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "toResults" {
            let controller = segue.destination  as! ResultViewController
            guard let score = sender as? Int else {
                return
            }
            controller.expectScore = score
            score1 = 0

        }
    }
    @IBAction func noButtonTapped(_ sender: Any){
        checkAnswer(True: false)
    }
    
    @IBAction func yesButtonTapped(_ sender: Any){
        checkAnswer(True: true)
    }
    
    func checkAnswer(True:Bool) {
        var colorsMatch = true
        
        if topTextColor == bottomTextColor{
            colorsMatch = true
        }else {
            colorsMatch = false
        }
        
        if True && colorsMatch {
            score1 += 1
        } else if True && !colorsMatch{
            score1 += 1
        } else if !True && !colorsMatch {
            score1 += 1
        } else if !True && colorsMatch {
            score1 -= 1
        }
        
        scoreLabel.text = "Score: \(score1)"
        
        topTextColor.getRandomOption()
        bottomTextColor.getRandomOption()
        
        topCardView.text = topTextColor.text
        bottomCardView.text = Color().text
        
        bottomCardView.textColor = bottomTextColor.textColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topCardView.text = topTextColor.text
        bottomCardView.text = Color().text
        
        bottomCardView.textColor = bottomTextColor.textColor
        
        timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        
        score1  = 0
        time = 60
        
        
        scoreLabel.text = "Score: \(score1)"
        timer.text = "Timer: \(time)"
    }


}

