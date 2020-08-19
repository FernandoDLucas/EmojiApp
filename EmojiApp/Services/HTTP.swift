//
//  HTTP.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 18/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import Foundation

enum HTTP{
    
    case get
    
    func request( url:URL?,
                  header:[String:String] = ["Content-Type":"application/json"],
                  body: [String:Any] = [:],
                  completion: @escaping (Data?, HTTPURLResponse?, Error?) -> Void = {data, response, error in}){
        
        guard let url = url else{
            completion(nil, nil, nil)
            return
        }
        
        switch self {
        case .get:
            URLSession.shared.dataTask(with: url) { data, response, error in
                completion(data, response as? HTTPURLResponse, error)
            }.resume()
        }
    }
}
