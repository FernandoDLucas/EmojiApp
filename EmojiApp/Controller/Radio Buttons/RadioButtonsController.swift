//
//  Radio Buttons Controller.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 16/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit

class RadioButtonsController : UIView {

    var button1 = RadioButton()
    var button2 = RadioButton()
    var button3 = RadioButton()
    var button4 = RadioButton()
    var button5 = RadioButton()
    var emoji1 = UILabel()
    var emoji2 = UILabel()
    var emoji3 = UILabel()
    var emoji4 = UILabel()
    var emoji5 = UILabel()
    var arrayOfButtons = [UIButton]()
    var arrayOfEmojis = [UILabel]()

    override init(frame: CGRect){
        super.init(frame: frame)
        setButtons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setButtons()
    }
    
    func setButtons(){
        
        arrayOfButtons = [button1, button2, button3, button4, button5]
        arrayOfEmojis = [emoji1, emoji2, emoji3, emoji3, emoji4, emoji5]
        for button in arrayOfButtons {
            button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        }
        
        
        let stackViewEmojis = UIStackView(arrangedSubviews: [emoji1, emoji2, emoji3, emoji3, emoji4, emoji5])
        let stackview = UIStackView(arrangedSubviews: [button1, button2, button3, button4, button5])
        self.addSubview(stackview)
        self.addSubview(stackViewEmojis)
                
        arrayOfButtons.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalTo: stackview.widthAnchor, multiplier: 0.12).isActive = true
            $0.heightAnchor.constraint(equalTo: stackview.widthAnchor, multiplier: 0.12).isActive = true
        }
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 17).isActive = true
        stackview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -17).isActive = true
        stackview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17).isActive = true
        stackview.alignment = .center
        stackview.distribution = .equalCentering
        
        arrayOfEmojis.forEach {
            $0.textAlignment = .center
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalTo: stackview.widthAnchor, multiplier: 0.12).isActive = true
            $0.heightAnchor.constraint(equalTo: stackview.widthAnchor, multiplier: 0.12).isActive = true
        }
        
        stackViewEmojis.translatesAutoresizingMaskIntoConstraints = false
        stackViewEmojis.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 17).isActive = true
        stackViewEmojis.bottomAnchor.constraint(equalTo: stackview.topAnchor).isActive = true
        stackViewEmojis.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17).isActive = true
        stackViewEmojis.alignment = .center
        stackViewEmojis.distribution = .equalCentering
}
    
    @objc func pressed(sender : UIButton){
        for button in arrayOfButtons {
            if button != sender {
                button.isSelected = false
            }
            sender.isSelected = true
        }
    }
    

    
}
