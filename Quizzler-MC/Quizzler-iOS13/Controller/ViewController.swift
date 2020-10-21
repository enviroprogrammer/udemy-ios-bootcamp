//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    // this code runs once the app is launched.
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonText()
        updateUI()
    }
    
    // set the button text to each of the 3 options for each question
    func setButtonText() {
        option1Button.setTitle(quizBrain.getOptionOne(), for: .normal)
        option2Button.setTitle(quizBrain.getOptionTwo(), for: .normal)
        option3Button.setTitle(quizBrain.getOptionThree(), for: .normal)
    }

    // this changes the question
    @IBAction func answerButtonPressed(_ sender: UIButton) {

        let userAnswer = sender.currentTitle! // user's answer
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        // runs once after button is pressed.
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo:nil, repeats: false)

    }
    
    // update question each time user answers previous one
    @objc func updateUI() {
        setButtonText()
        questionLabel.text = quizBrain.getQuestionText()
        option1Button.backgroundColor = UIColor.clear
        option2Button.backgroundColor = UIColor.clear
        option3Button.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
}

