//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    deinit {
        timer?.invalidate()
    }
    
    var timer: Timer?
    var remainingTime = 0
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720
    ]
    
    @IBAction func hardnesSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!

        if let result = eggTimes[hardness] {
            remainingTime = result
            progressBar.progress = 1.0
            startTimer()
        }
    }
    func startTimer() {
        timer?.invalidate()
        
        let totalTime = remainingTime
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.remainingTime -= 1
            
            let progress = Float(self.remainingTime) / Float(totalTime)
            self.progressBar.setProgress(progress, animated: true)
            print("Time remaining: \(self.remainingTime)")
            
            if self.remainingTime <= 0 {
                self.timer?.invalidate()
                print("Egg is ready")
            }
        }
    }
    
}
