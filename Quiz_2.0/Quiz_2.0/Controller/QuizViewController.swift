//
//  ViewController.swift
//  Quiz_2.0
//
//  Created by Hanoudi on 6/23/20.
//  Copyright © 2020 Hanan. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //  MARK:- Outlets
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    //  MARK:- Quiz Cerebrum
    var quizMind = QuizMind()
    


    //  MARK:- Functions
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizMind.checkAnswer(answer: userAnswer)
        
        // interactive
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor =  .red
        }
        
        quizMind.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizMind.getQuestionText()
        
        //Need to fetch the answers and update the button titles using the setTitle method.
        let answerChoices = quizMind.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizMind.getProgress()
        scoreLabel.text = "Score: \(quizMind.getScore())"
        
        choice1.backgroundColor = .clear
        choice2.backgroundColor = .clear
        choice3.backgroundColor = .clear
        
    }
    
    //  MARK:- Life Cycle of Quiz view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

}

