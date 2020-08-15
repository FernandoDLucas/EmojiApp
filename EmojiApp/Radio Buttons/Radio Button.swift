//
//  Radio Button.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 15/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit

class RadioButton : UIButton {
    
    let strokeLayer = CAShapeLayer()
    
    override var isSelected: Bool{
        didSet{
            changeButton()
        }
    }
    
    @IBInspectable var strokeColor : UIColor = .red {
        didSet{
            strokeLayer.fillColor = strokeColor.cgColor
            self.changeButton()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setButton()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setButton()
    }
    func setButton(){
        strokeLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let path = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle:2*CGFloat.pi, clockwise: true)
        strokeLayer.path = path.cgPath
        self.frame = bounds
        layer.addSublayer(strokeLayer)
        self.changeButton()
    }
    
    func changeButton(){
        if self.isSelected{
            strokeLayer.fillColor = strokeColor.cgColor
        } else {
            strokeLayer.fillColor = UIColor.yellow.cgColor
        }
    }
    
    
}
