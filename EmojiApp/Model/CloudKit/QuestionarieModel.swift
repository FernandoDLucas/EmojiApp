//
//  QuestionarieModel.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 01/10/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import Foundation
import CloudKit

class QuestionarieCK {
    
    static let recordType = "Questionarie"
    private let id : CKRecord.ID
    let title: String
    let numberOfQuestions: Int
    private(set) var questions: [Question]? = nil
    
    init?(record: CKRecord, database: CKDatabase){
        guard let title = record["title"] as? String, let numberOfQuestions = record["numberOfQuestions"] as? Int else { return nil}
        
        id = record.recordID
        self.title = title
        self.numberOfQuestions = numberOfQuestions
        
        if let questionsRecord = record["questions"] as? [CKRecord.Reference]{
            Question.fetchQuestions(for: questionsRecord){ questions in
                self.questions = questions
                
            }
        }
    }
    
    
}
