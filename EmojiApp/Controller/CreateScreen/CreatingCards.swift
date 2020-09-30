//
//  CreatingCards.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 27/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit


class CreatingCards : UICollectionViewCell {
    
    let cancelButton : UIButton = {
        let button = UIButton(type: .close)
        button.backgroundColor = .white
        return button
    }()
    
    let backgroundCard : CAShapeLayer = {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath( roundedRect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 0.63, height: UIScreen.main.bounds.height * 0.25),
                                         cornerRadius: 10)
        layer.path = circularPath.cgPath
        layer.lineCap = .round
        layer.fillColor = UIColor.white.cgColor
        layer.shadowPath = circularPath.cgPath
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        return layer
    }()
    
   lazy var label : UITextField = {
        let label = UITextField()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        label.textColor = .calmPurple
        return label
    }()
    
    override init(frame: CGRect) {
             super.init(frame: frame)
             setupView()
            setupConstraints()
         }
              
    required init?(coder: NSCoder) {
             super.init(coder: coder)
             setupView()
            setupConstraints()
         }
    
    func setupView(){
        self.layer.addSublayer(backgroundCard)
        self.addSubview(label)
        self.addSubview(cancelButton)
    }
    
    func setupConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        label.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.width * 0.63).isActive = true
        label.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.25).isActive = true
        cancelButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.alpha = 1.0
        }
    }
}


protocol creatingDelegate : class {
    func hideButton (esconder: Bool)
}

extension CreatingCards : creatingDelegate {
    func hideButton(esconder: Bool) {
        self.cancelButton.isHidden = esconder
    }
    
}
