//
//  Router.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 18/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import Foundation


protocol router {
    var hostname: String {get}
    var url : URL? {get}
}
