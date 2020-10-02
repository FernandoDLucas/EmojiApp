//
//  Questions.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 01/10/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import Foundation
import CloudKit

class Question {
    
    static let recordType = "Question"
    private let recordId : CKRecord.ID
    let indexOfQuestion : Int?
    let text : String?
    let questionarieReference: CKRecord.Reference?
    let id: String?

    init(record: CKRecord) {
        recordId = record.recordID
        indexOfQuestion = record["indexOfQuestion"] as? Int
        questionarieReference = record["questionarie"] as? CKRecord.Reference
        text = record["text"] as? String
        id = record["id"] as? String
    }
    
    static func fetchQuestions(_ completion: @escaping (Result<[Question], Error>) -> Void) {
        let query = CKQuery(recordType: "Question", predicate: NSPredicate(value: true))
        let container = CKContainer.default()
        container.publicCloudDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) {
            results, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let result = results else {return}
            let questions = result.map(Question.init)
            DispatchQueue.main.async {
                completion(.success(questions))
            }
        }
    }
    
    static func fetchQuestions(for references: [CKRecord.Reference], _ completion: @escaping ([Question]) -> Void) {
        let recordsIDs = references.map{$0.recordID}
        let operation = CKFetchRecordsOperation(recordIDs: recordsIDs)
      //  operation.qualityOfService = .utility
        
        operation.fetchRecordsCompletionBlock = {
            records, errors in
            let questions = records?.values.map(Question.init) ?? []
            DispatchQueue.main.async {
                completion(questions)
            }
        }
        
        ModelCK.currentModel.publicDB.add(operation)
    }
    
}
