//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Monica Iqbal on 2020-08-05.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    // quiz questions to ask user
    // each item is a Question struct
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    // keep track of question # and score
    var questionNumber = 0
    var score = 0
    
    // add _ to indicate that there shouldn't be an external parameter name
    // either user got it right or wrong
    // -> Bool: function returns a bool value
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correct {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    // get question text from Quiz array
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    // get progress and pass this to the progress bar UI so that it updates itself
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
    
    // add "mutating" in front of function declaration so that we can change the value of questionNumber
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            score = 0
            questionNumber = 0
        }
    }
    
    // get options 1, 2, and 3 so we can add them as the button labels
    func getOptionOne() -> String {
        return quiz[questionNumber].answer[0]
    }
    
    func getOptionTwo() -> String {
        return quiz[questionNumber].answer[1]
    }
    
    func getOptionThree() -> String {
        return quiz[questionNumber].answer[2]
    }
    
    func getScore() -> Int {
        return score
    }
    
}
