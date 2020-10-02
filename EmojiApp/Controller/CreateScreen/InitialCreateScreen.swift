//
//  InitialCreateScreen.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 28/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit

class InitialCreateScreenViewController : UIViewController{
    
    let secondBackground = FirstBackgroundGradient()
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CreatingCards.self, forCellWithReuseIdentifier: "CreatingCell")
        cv.backgroundColor = .red
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    let labelId : UITextField = {
        let labelId = UITextField()
        labelId.placeholder = "Título do Questionário"
        labelId.backgroundColor = .white
        labelId.textAlignment = .center
        return labelId
    }()
    
    let labelEscala : UILabel = {
        let label = UILabel()
        label.text = "Escala de Emojis"
        label.textColor = .white
        return label
    }()
    
    let stackEmoji = StackEmojis()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundLayer = secondBackground.gl
        backgroundLayer.frame = self.view.bounds
        let saveButton = UIBarButtonItem(title: "Avançar", style: .done, target: self, action: #selector(teste))
        self.navigationItem.rightBarButtonItem = saveButton
        self.view.layer.addSublayer(backgroundLayer)
        setIdTextField()
        setLabelEscala()
        setStackEmojis()
    }
    
    func setIdTextField(){
        self.view.addSubview(labelId)
        labelId.translatesAutoresizingMaskIntoConstraints = false
        labelId.topAnchor.constraint(equalToSystemSpacingBelow: self.view.topAnchor, multiplier: 18).isActive = true
        labelId.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelId.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
    
    func setLabelEscala(){
        self.view.addSubview(labelEscala)
        labelEscala.translatesAutoresizingMaskIntoConstraints = false
        labelEscala.topAnchor.constraint(equalToSystemSpacingBelow: self.labelId.topAnchor, multiplier: 10).isActive = true
        labelEscala.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
    
    func setStackEmojis() {
        self.view.addSubview(stackEmoji)
        stackEmoji.translatesAutoresizingMaskIntoConstraints = false
        stackEmoji.topAnchor.constraint(equalToSystemSpacingBelow: self.labelEscala.bottomAnchor, multiplier: 1).isActive = true
        stackEmoji.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        stackEmoji.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true        
    }
    @objc func teste(){
        self.navigationController?.pushViewController(CreateScreenViewController(), animated: true)
    }
}

class StackEmojis : UIView {
    let emoji1 = UITextField()
    let emoji2 = UITextField()
    let emoji3 = UITextField()
    let emoji4 = UITextField()
    let emoji5 = UITextField()
    var arrayOfEmojis = [UITextField]()
    
    
    override init(frame: CGRect) {
             super.init(frame: frame)
             setStackView()
         }
              
    required init?(coder: NSCoder) {
             super.init(coder: coder)
             setStackView()
         }
    
    func setStackView(){
        let stackview = UIStackView(arrangedSubviews: [emoji1, emoji2, emoji3, emoji4, emoji5])
        arrayOfEmojis = [emoji1, emoji2, emoji3, emoji4, emoji5]
        self.addSubview(stackview)
          arrayOfEmojis.forEach {
            $0.backgroundColor = .white
            $0.borderStyle = .roundedRect
            $0.textAlignment = .center
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
    }
}
