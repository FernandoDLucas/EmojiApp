//
//  Colors.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 12/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit


extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static let calmPurple = UIColor.rgb(r: 236, g: 179 , b: 243)
    static let calmBlue = UIColor.rgb(r: 177, g: 211 , b: 233)
    static let calmPink = UIColor.rgb(r: 255.0, g: 154.0, b: 230.0)


}

