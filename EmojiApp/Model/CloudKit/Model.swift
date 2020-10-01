//
//  Model.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 01/10/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import Foundation
import CloudKit

class ModelCK {
    let container: CKContainer
    let publicDB: CKDatabase
    let privateDB: CKDatabase
    
    private(set) var Questionaries : [QuestionarieCK] = []
    static var currentModel = ModelCK()
    
    init() {
        container = CKContainer.default()
        publicDB = container.publicCloudDatabase
        privateDB = container.privateCloudDatabase
    }
    
     func refresh (_ completion: @escaping (Result<[QuestionarieCK], Error>) -> Void ) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Questionarie", predicate: predicate)
        Questionaries(forQuery: query, completion)
    }
    
    private func Questionaries(forQuery query: CKQuery, _ completion: @escaping (Result<[QuestionarieCK], Error>) -> Void){
        publicDB.perform(query, inZoneWith: CKRecordZone.default().zoneID) { [weak self] results, errors in
            guard let self = self else {return}
            if let error = errors {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            guard let result = results else { return }
            
//            self.Questionaries = result.compactMap{
//                QuestionarieCK(record: $0, database : self.publicDB)
//            }
            let questionaries = result.compactMap{
                    QuestionarieCK(record: $0, database : self.publicDB)
            }
            
            DispatchQueue.main.async {
                completion(.success(questionaries))
            }
        }
    }
}
