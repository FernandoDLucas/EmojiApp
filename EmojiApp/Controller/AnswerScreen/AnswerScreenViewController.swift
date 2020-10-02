//
//  AnswerScreenViewController.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 13/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit


class AnswerScreenViewController : UIViewController{
    
    let AnsBackground = SecBackgroundGradient()
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(AnswerCards.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    let titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    var textReturn : String? = nil {
        didSet{
            DispatchQueue.main.async{
                self.titleLabel.text = self.textReturn
            }
        }
    }
    
    var listOfQuestion : [Question] = [] {
           didSet{
               DispatchQueue.main.async {
                   self.collectionView.reloadData()
               }
           }
       }

//
    var questionResult : [QuestionarieCK?] = [] {
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundLayer = AnsBackground.gl
        backgroundLayer.frame = self.view.frame
        self.view.layer.addSublayer(backgroundLayer)
        setTitleLabel()
        setCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
        cloudkitHandler()
       // APIHandler()
        
    }
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        self.view.layer.sublayers?.first?.frame = self.view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func setTitleLabel(){
        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 160).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
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
    
    func cloudkitHandler() {
        ModelCK.currentModel.refresh{ response in
            switch response {
            case .success(let data):
                self.questionResult = data
                print(self.questionResult)
            case . failure(let error):
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
        
    }
    
}

extension AnswerScreenViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfQuestion.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AnswerCards
        cell.backgroundColor = .clear
        cell.config(of: listOfQuestion[indexPath.row])
        return cell
    }
}
