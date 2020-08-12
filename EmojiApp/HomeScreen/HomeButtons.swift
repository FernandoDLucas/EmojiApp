//
//  CreateButtom.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 12/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit

class HomeButtons : UIView {
    
    let label : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let Card : CAShapeLayer = {
          let layer = CAShapeLayer()
        let circularPath = UIBezierPath( roundedRect: CGRect(x: 0, y: 0, width: 190, height: 180),
                       cornerRadius: 10)
          layer.path = circularPath.cgPath
          layer.lineCap = .round
          return layer
      }()
    
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupView()
       }
            
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           setupView()
        setupConstraints()
       }
       
       func setupView(){
           self.layer.addSublayer(Card)

       }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
               
                   label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
    ])
    }
    
}
