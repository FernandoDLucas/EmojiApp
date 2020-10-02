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
    
    let collectionView : UICollectionView = {
          let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .horizontal
          let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
          cv.register(CreatingCards.self, forCellWithReuseIdentifier: "cell")
          cv.backgroundColor = .clear
          cv.showsHorizontalScrollIndicator = false
          return cv
      }()
    
    let models: [CreatingCardsModel] = [.init(selectedButton: nil), .init(selectedButton: nil), .init(selectedButton: nil), .init(selectedButton: nil)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundLayer = secondBackground.gl
        backgroundLayer.frame = self.view.bounds
        let saveButton = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(teste))
        self.navigationItem.rightBarButtonItem = saveButton
        self.view.layer.addSublayer(backgroundLayer)
        collectionView.delegate = self
        collectionView.dataSource = self
        setIdTextField()
        setCollectionView()
    }
    
    func setIdTextField(){
        self.view.addSubview(labelId)
        labelId.translatesAutoresizingMaskIntoConstraints = false
        labelId.topAnchor.constraint(equalToSystemSpacingBelow: self.view.topAnchor, multiplier: 15).isActive = true
        labelId.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelId.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
    
    func setCollectionView(){
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 17).isActive = true
        collectionView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: 17).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.39).isActive = true
    }
    
    @objc func teste(){
        print("deu bom")
    }
    
}


class CreatingCardsModel {
    internal init(selectedButton: Int? = nil) {
        self.selectedButton = selectedButton
    }
    
    
    var selectedButton: Int?
    
}

extension CreateScreenViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CreatingCards
        cell.configure(with: model)
        cell.buttons.didChangeSelection =  { selected in
            model.selectedButton = selected
        }
        cell.backgroundColor = .clear
        return cell
    }
}
//
///
//extension CreateScreenViewController: RadioButtonsControllerDelegate {
//    func didSelectIndex(index: Int?, cardIndex) {
//
//    }
//
//
//}

