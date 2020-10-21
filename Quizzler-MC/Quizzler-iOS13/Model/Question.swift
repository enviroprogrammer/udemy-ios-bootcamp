//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Monica Iqbal on 2020-08-05.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    // constants for questions + answers in quiz
    let text: String
    let answer: [String]
    let correct: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        correct = correctAnswer
    }
}
