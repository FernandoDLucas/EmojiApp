//
//  QuestionarieRepository.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 18/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import Foundation

class QuestionarieRepository {
    func read(category: QuestionarieAPI, completion: @escaping (Result<Questionarie, Error>) -> Void) {
        HTTP.get.request(url: category.url) { data, response, err in
            if let err = err{
                completion(.failure(err))
                return
            }
            guard let data = data, let response = response else {
                return
            }
            switch response.statusCode{
            case 200:
                do {
                        let questionaries:Questionarie = try JSONDecoder().decode(Questionarie.self, from: data)
                        completion(.success(questionaries))
                } catch let JsonError{
                    completion(.failure(JsonError))
                }
                return
            default:
            return
        }
        }
    }
}
