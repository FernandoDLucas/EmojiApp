//
//  CreateScreenViewController.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 13/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit

class CreateScreenViewController : UIViewController{
    
    
    let secondBackground = FirstBackgroundGradient()
    let labelId : UITextField = {
        let labelId = UITextField()
        labelId.placeholder = "Título do Questionário"
        labelId.backgroundColor = .white
        labelId.textAlignment = .center
        return labelId
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundLayer = secondBackground.gl
        backgroundLayer.frame = self.view.bounds
        let saveButton = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(teste))
        self.navigationItem.rightBarButtonItem = saveButton
        self.view.layer.addSublayer(backgroundLayer)
        setIdTextField()
    }
    
    func setIdTextField(){
        self.view.addSubview(labelId)
        labelId.translatesAutoresizingMaskIntoConstraints = false
        labelId.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 160).isActive = true
        labelId.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelId.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
    }
    
    @objc func teste(){
        print("deu bom")
    }
    
}
