//
//  resultViewController.swift
//  brainGame
//
//  Created by XIN on 3/3/20.
//  Copyright © 2020 XIN. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    var expectScore: Int = 0
    
    @IBOutlet weak var resultScore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            resultScore.text = "Your Score: \(expectScore)"
       
    }
    
    
}
