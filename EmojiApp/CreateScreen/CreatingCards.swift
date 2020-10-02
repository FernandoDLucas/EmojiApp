//
//  CreatingCards.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 24/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit


class CreatingCards : UICollectionViewCell {

   
    
    let backgroundCard : CAShapeLayer = {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath( roundedRect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 34, height: UIScreen.main.bounds.height * 0.39),
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
    
   lazy var label : UITextView = {
        let label = UITextView()
        label.textAlignment = .center
        //label.placeholder = "Pergunta"
        label.insertTextPlaceholder(with: CGSize(width: 20, height: 20))
        label.font = .systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        label.textColor = .calmPurple
        return label
    }()
    
    let buttons : RadioButtonsController = {
        let buttons = RadioButtonsController()
        return buttons
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
         
    
    override func prepareForReuse() {
           super.prepareForReuse()
           buttons.arrayOfButtons.forEach {
               $0.isSelected = false
           }
       }
    
    func configure(with model: CreatingCardsModel) {
        if let selected = model.selectedButton {
            buttons.arrayOfButtons[selected].isSelected = true
        }
    }
       
    
    func setupView(){
        self.layer.addSublayer(backgroundCard)
        self.addSubview(label)
        self.addSubview(buttons)
    }
    
    func setupConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 36).isActive = true
        label.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3).isActive = true
        
        buttons.translatesAutoresizingMaskIntoConstraints = false
        buttons.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        buttons.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 36).isActive = true
        buttons.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.1).isActive = true
        
    }
}
