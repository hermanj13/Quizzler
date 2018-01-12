//
//  Question.swift
//  Quizzler
//
//  Created by Jake Herman on 1/11/18.
//  Copyright © 2018 Jake Herman. All rights reserved.
//

import Foundation

class Question {
    let questionText : String
    let answer : Int
    
    init(text:String, correctAnswer: Int) {
        questionText = text
        answer = correctAnswer
    }
    
}
