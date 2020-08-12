//
//  HomeScreenViewController.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 11/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    
    let colors = backgroundGradient()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var backgroundLayer = colors.gl
        backgroundLayer.frame = self.view.frame
        self.view.layer.addSublayer(backgroundLayer)
    }
    
    
}
