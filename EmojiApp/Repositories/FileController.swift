//
//  FileController.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 21/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import Foundation

struct FileController {
    
    let manager = FileManager.default
    let mainPath  = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

       @discardableResult
       func createFile(with data: Data, name: String) -> Bool {
           let contentPath = constructPath(named: name)
           manager.createFile(atPath: contentPath.path, contents: data, attributes: nil)
        print(contentPath)
           return manager.fileExists(atPath: contentPath.path)
       }
       
       @discardableResult
       func updateFile(at path: String, data: Data) -> Bool {
           let contentPath = constructPath(named: path)
           do {
               try data.write(to: contentPath)
               return true
           } catch (let error) {
               print(error.localizedDescription)
               return false
           }
       }
       
       func constructPath(named: String, from path: String? = nil) -> URL {
           let contentPath = mainPath
           if let path = path {
               return contentPath.appendingPathComponent(path).appendingPathComponent(named)
           } else {
               return contentPath.appendingPathComponent(named)
           }
       }
       
       func retrieveFile(at path: String) -> Data? {
           let contentPath = constructPath(named: path)
           let data = try? Data(contentsOf: contentPath)
           return data
       }
}
