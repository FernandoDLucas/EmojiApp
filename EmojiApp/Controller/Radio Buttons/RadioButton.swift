//
//  Radio Button.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 15/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit

class RadioButton : UIButton {
    
    override var isSelected: Bool{
        didSet{
            changeButton()
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
     self.backgroundColor = .calmBlue
        self.changeButton()
    }
    
     override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.size.width / 2
        self.clipsToBounds = true
    }
    
    func changeButton(){
        if self.isSelected{
            self.setImage(nil, for: .selected)
            self.setImage(#imageLiteral(resourceName: "checkmark"), for: .selected)
        } else{
            self.setImage(nil, for: .selected)
        }
}
}
