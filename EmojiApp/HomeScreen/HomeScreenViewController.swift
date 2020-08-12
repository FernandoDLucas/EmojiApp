//
//  HomeScreenViewController.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 11/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    
    let colors = FirstBackgroundGradient()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        var backgroundLayer = colors.gl
        backgroundLayer.frame = self.view.bounds
        self.view.layer.addSublayer(backgroundLayer)
        setCreateButtom()
        setWelcome()
    }
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        self.view.layer.sublayers?.first?.frame = self.view.bounds
    }

    
    func setCreateButtom(){
        let buttom = HomeButtons()
        buttom.label.text = "Criar um Questionário"
        buttom.label.textColor = .black
        buttom.Card.fillColor = UIColor.white.cgColor
        self.view.addSubview(buttom)
        
        
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -97).isActive = true
        buttom.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 231).isActive = true
    }
    
    
    func setWelcome(){
        
        let label = UILabel()
        label.text = "Bem-Vindo"
        label.font = .systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        label.textColor = .white
        
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 91).isActive = true
//        label.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//
}
}
