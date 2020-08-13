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
    let createButton : HomeButtons = {
        let buttom = HomeButtons()
        buttom.label.text = "Criar Questionário"
        buttom.label.textColor = .calmPurple
        buttom.label.font = .systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        buttom.Card.fillColor = UIColor.white.cgColor
        return buttom
    }()
    
    let answerButton : HomeButtons = {
        let buttom = HomeButtons()
              buttom.label.text = """
           Responder
           Questionário
           """
           buttom.label.textAlignment = .center
           buttom.label.numberOfLines = 2
           buttom.image.image = #imageLiteral(resourceName: "AnswerButtomImage")
              buttom.label.textColor = .calmPurple
              buttom.label.font = .systemFont(ofSize: 20, weight: UIFont.Weight.bold)
              buttom.Card.fillColor = UIColor.white.cgColor
        return buttom
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundLayer = colors.gl
        backgroundLayer.frame = self.view.bounds
        
        self.view.layer.addSublayer(backgroundLayer)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        setCreateButtom()
        setAnswerButtom()
        setWelcome()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
 }
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        self.view.layer.sublayers?.first?.frame = self.view.bounds
    }

    
    func setCreateButtom(){
        self.view.addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        createButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 231).isActive = true
        createButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: 180).isActive = true
        createButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goAnswer)))
    }
    
    
    func setAnswerButtom(){
           self.view.addSubview(answerButton)
           answerButton.translatesAutoresizingMaskIntoConstraints = false
           answerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
           answerButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 489).isActive = true
        answerButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
            answerButton.heightAnchor.constraint(equalToConstant: 180).isActive = true
}
    
    func setWelcome(){
        let label = UILabel()
        label.text = "Bem-Vindo"
        label.font = .systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        label.textColor = .white
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 91).isActive = true
        label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 17).isActive = true
}
    
    
     @objc func goAnswer() {
           let sampleStoryBoard : UIStoryboard = UIStoryboard(name: "Answer", bundle:nil)
           let answerView  = sampleStoryBoard.instantiateViewController(withIdentifier: "AnswerScreenViewController") as! AnswerScreenViewController
        self.navigationController?.pushViewController(answerView, animated: true)
    }
    
}
