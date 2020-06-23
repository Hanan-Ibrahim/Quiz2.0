//
//  Question.swift
//  Quiz_2.0
//
//  Created by Hanoudi on 6/23/20.
//  Copyright © 2020 Hanan. All rights reserved.
//
//  This is the structure of multiple choice question.

import Foundation

struct Question {
    // Question
    let question: String
    
    // Possible choices -> Array of answers
    let answers: [String]
    
    // One correct answer from Array of questions
    let rightAnswer: String
    
    // The initialiser
    init(q: String, a: [String], correctAnswer: String) {
        question = q
        answers = a
        rightAnswer = correctAnswer
    }
}

    
