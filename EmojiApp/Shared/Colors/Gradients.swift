//
//  Colors.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 11/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit

class FirstBackgroundGradient{
    
    var gl : CAGradientLayer

       init(){
           let colorTop = UIColor(red: 255.0 / 255.0, green: 216.0 / 255.0, blue: 79.0 / 255.0, alpha: 1.0).cgColor
           let colorBottom = UIColor(red: 255.0 / 255.0, green: 154.0 / 255.0, blue: 230.0 / 255.0, alpha: 1.0).cgColor

           self.gl = CAGradientLayer()
           self.gl.colors = [colorTop, colorBottom]
           self.gl.locations = [0.0, 1.0]
       }
}

class SecBackgroundGradient{
    
    var gl : CAGradientLayer

       init(){
           let colorTop = UIColor(red: 238.0 / 255.0, green: 151.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0).cgColor
           let colorBottom = UIColor(red: 141.0 / 255.0, green: 247.0 / 255.0, blue: 229.0 / 255.0, alpha: 1.0).cgColor

           self.gl = CAGradientLayer()
           self.gl.colors = [colorTop, colorBottom]
           self.gl.locations = [0.0, 1.0]
       }
}

class dataBackgroundGradient{
    var gl : CAGradientLayer

    init(){
        let colorTop = UIColor(red: 156.0 / 255.0, green: 244.0 / 255.0, blue: 216.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 160.0 / 255.0, green: 167.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0).cgColor

        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}

