//
//  DataCard.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 03/09/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit

class DataCard : UICollectionViewCell{
    
    let backgroundCard : CAShapeLayer = {
        let layer = CAShapeLayer()
             let circularPath = UIBezierPath( roundedRect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.width * 0.25),
                                              cornerRadius: 10)
             layer.path = circularPath.cgPath
             layer.lineCap = .round
             layer.fillColor = UIColor.white.cgColor
             layer.shadowPath = circularPath.cgPath
             layer.shadowRadius = 3
             layer.shadowOpacity = 0.2
             layer.shadowOffset = .zero
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        setupView()
    }
    
    func setupView(){
        self.layer.addSublayer(backgroundCard)
    }
    
}
