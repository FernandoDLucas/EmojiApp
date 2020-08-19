//
//  Questionarie.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 18/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import Foundation


public struct Questionarie : Decodable, Encodable{
   
    var ID : Int?
    var title : String?
    var totalOfQuestions : Int?
    var questions : [Question]
    
   init(ID: Int, title: String, totalOfQuestions: Int, questions: [Question]) {
           self.ID = ID
           self.title = title
           self.totalOfQuestions = totalOfQuestions
           self.questions = questions
       }
}

public struct Question : Decodable, Encodable {
    
    var emojiOptions : [EmojiOptions]
    var numberOfQuestion : Int
    var text : String
    
    init(numberOfQuestion: Int, text: String, emojiOptions: [EmojiOptions]) {
           self.numberOfQuestion = numberOfQuestion
           self.text = text
           self.emojiOptions = emojiOptions
       }
}

public struct EmojiOptions : Decodable, Encodable{
    
    var emoji3 : String
    var emoji4 : String
    var emoji1 : String
    var emoji5 : String
    var emoji2 : String
    
    init(emoji1: String, emoji2: String, emoji3: String, emoji4: String, emoji5: String) {
          self.emoji1 = emoji1
          self.emoji2 = emoji2
          self.emoji3 = emoji3
          self.emoji4 = emoji4
          self.emoji5 = emoji5
      }
}
