//
//  AnswerScreenViewController.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 13/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit

class AnswerScreenViewController : UIViewController{
    
    
    let secondBackground = FirstBackgroundGradient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundLayer = secondBackground.gl
        backgroundLayer.frame = self.view.bounds
        self.view.layer.addSublayer(backgroundLayer)
    }
    
}
