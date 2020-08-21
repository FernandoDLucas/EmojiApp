//
//  StoreAPI.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 18/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import Foundation


enum QuestionarieAPI: router {
    case ID
    
    var hostname: String{
        get{
            return "http://127.0.0.1:8080"
        }
    }
    
    var url: URL?{
        get {
            switch self {
            case .ID:
                return URL(string: "\(hostname)/teste")
            }
        }
    }
    
}
