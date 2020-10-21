//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    let secondsToBoil = ["Soft": 3, "Medium": 4, "Hard": 7]
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    func runTimer() {
        timer.invalidate() // start a new timer each time button is pressed.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        // time interval: how often we want timer to fire
        // indicate whether we want timer to repeat via repeats parameter
        // selector: function to call each time timer fires. here we call update timer each time timer fires.
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    // selector comes from objective C.
    // add @objc to expose this method
    @objc func updateTimer() {
        // update progress bar
        if secondsPassed <= totalTime {
            let percentProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = percentProgress
            secondsPassed += 1  // count down seconds
        } else {
            timer.invalidate() // stop timer from going on
            titleLabel.text = "Done!"
            playSound(soundName: "alarm_sound")
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // sender: button that triggers IBAction
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle! // initial type: string optional
        // convert to non-optional by adding !
        progressBar.progress = 0.0
        totalTime = secondsToBoil[hardness]!
        secondsPassed = 0
        titleLabel.text = hardness
        runTimer()
        
    }
    
}

