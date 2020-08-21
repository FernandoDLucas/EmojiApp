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
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 172, height: 33))
        return label
    }()
    
    let Card : CAShapeLayer = {
          let layer = CAShapeLayer()
        let circularPath = UIBezierPath( roundedRect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 0.45 , height: UIScreen.main.bounds.width * 0.40),
                       cornerRadius: 10)
          layer.path = circularPath.cgPath
          layer.lineCap = .round
        layer.shadowPath = circularPath.cgPath
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        return layer
      }()
    
    let image : UIImageView = {
        let imageView = UIImageView()
        let imagem = #imageLiteral(resourceName: "CreateButtomImage")
        imageView.image = imagem
        return imageView
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
           self.layer.addSublayer(Card)
            self.addSubview(label)
            self.addSubview(image)
       }
    
    func setupConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 4).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalToSystemSpacingBelow: label.topAnchor, multiplier: 6).isActive = true
        image.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
}
