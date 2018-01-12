//
//  ViewController.swift
//  Quizzler
//
//  Created by Jake Herman on 1/11/18.
//  Copyright © 2018 Jake Herman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank().list
    
    var currentQuestion : Int = 0
    
    var currentScore : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        checkAnswer(answer: sender.tag, correct: allQuestions[currentQuestion].answer)
        nextQuestion()
    }
    
    
    func updateUI() {
        questionLabel.text = allQuestions[currentQuestion].questionText
		
        scoreLabel.text = "Score: \(currentScore)"
		
		progressLabel.text = "\(currentQuestion + 1)/13"
		progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(currentQuestion + 1)
    }
    

    func nextQuestion() {
        currentQuestion += 1
        
        if currentQuestion > 12 {
			let alert = UIAlertController(title: "GAME OVER!", message: "Your final score was \(currentScore), would you like to play again?", preferredStyle: .alert)
			
			let restartAction = UIAlertAction(title: "Play Again", style: .default, handler: { (UIAlertAction) in
				self.startOver()
			})
			
			alert.addAction(restartAction)
			
			present(alert, animated: true, completion: nil)
			
		} else{
			updateUI()
		}
    }
    
    
    func checkAnswer(answer: Int, correct: Int) {
        if answer-1 == correct {
			ProgressHUD.showSuccess("Correct")
            currentScore += 1
		} else{
			ProgressHUD.showError("Incorrect")
		}
    }
    
    
    func startOver() {
        currentQuestion = 0
        currentScore = 0
		updateUI()
    }
    

    
}
