//
//  ServiceTest.swift
//  EmojiAppTests
//
//  Created by Fernando de Lucas da Silva Gomes on 22/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import XCTest

@testable import EmojiApp
class ServiceTest: XCTestCase {
    
    func test_valid_url(){
        let url = URL(string: "http://127.0.0.1:8080/teste")
        let expect = expectation(description: "espere")
        
        QuestionarieRepository().read(category: QuestionarieAPI.ID) { _ in
            XCTAssertEqual(url, )
        }
        
        wait(for: [expect], timeout: 5)
    }
}
