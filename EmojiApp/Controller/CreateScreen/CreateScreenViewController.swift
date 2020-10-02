//
//  CreateScreenViewController.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 13/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit

class CreateScreenViewController : UIViewController{
    
    var numberofQuestions : [String] =  [] {
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    weak var delegate : creatingDelegate?
    
    let secondBackground = FirstBackgroundGradient()
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CreatingCards.self, forCellWithReuseIdentifier: "CreatingCell")
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear 
        return cv
    }()
    
    let addButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "addquestion icon "), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundLayer = secondBackground.gl
        backgroundLayer.frame = self.view.bounds
        self.view.layer.addSublayer(backgroundLayer)
        collectionView.delegate = self
        collectionView.dataSource = self
        setCollectionView()
        setButton()
    }
    
    func setCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalToSystemSpacingBelow: self.view.topAnchor, multiplier: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 17).isActive = true
        collectionView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: 17).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.29).isActive = true
    }
    
    func setButton(){
        self.view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.topAnchor.constraint(equalToSystemSpacingBelow: collectionView.bottomAnchor, multiplier: 4).isActive = true
        addButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.addTarget(self, action: #selector(teste2), for: .touchUpInside)

    }
    
    @IBAction func teste2(sender: UIButton){
        numberofQuestions.append("+1")
    }
    
    @IBAction func removeQuestion(sender: UIButton) {
        numberofQuestions.remove(at: sender.tag)
    }
}

extension CreateScreenViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1.5, height: collectionView.frame.height)
      }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
}
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberofQuestions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreatingCell", for: indexPath) as! CreatingCards
        cell.cancelButton.tag = indexPath.row
        cell.cancelButton.addTarget(self, action: #selector(removeQuestion), for: .touchUpInside)
        return cell
}
}
