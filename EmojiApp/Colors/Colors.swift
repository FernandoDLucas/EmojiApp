//
//  Colors.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 11/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit

class backgroundGradient{
    
    var gl : CAGradientLayer

       init(){
           let colorTop = UIColor(red: 255.0 / 255.0, green: 216.0 / 255.0, blue: 79.0 / 255.0, alpha: 1.0).cgColor
           let colorBottom = UIColor(red: 236.0 / 255.0, green: 152.0 / 255.0, blue: 239.0 / 255.0, alpha: 1.0).cgColor

           self.gl = CAGradientLayer()
           self.gl.colors = [colorTop, colorBottom]
           self.gl.locations = [0.0, 1.0]
       }
}
