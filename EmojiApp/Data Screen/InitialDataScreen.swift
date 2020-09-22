//
//  InitialDataScreen.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 03/09/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit

class InitialDataScreenViewController : UIViewController {
    
    let dataBackground = dataBackgroundGradient()
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(DataCard.self, forCellWithReuseIdentifier: "DataCard")
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    let tableView : UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellTB")
        return tableView
    }()
    
    let allLabel : UILabel = {
        let label = UILabel()
        label.text = "Todos"
        label.font = .systemFont(ofSize: 20)
       return label
    }()
    
    override func viewDidLoad() {
        let backgroundLayer = dataBackground.gl
            backgroundLayer.frame = self.view.bounds
        self.view.layer.addSublayer(backgroundLayer)
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.dataSource = self
        tableView.delegate = self
        setCollectionView()
        setAllLabel()
        setTableView()
    }
    
    func setAllLabel(){
        view.addSubview(allLabel)
        allLabel.translatesAutoresizingMaskIntoConstraints = false
        allLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
    }
    
    func setCollectionView(){
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalToSystemSpacingBelow: self.view.topAnchor, multiplier: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 17).isActive = true
        collectionView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: 17).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    func setTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalToSystemSpacingBelow: allLabel.bottomAnchor, multiplier: 3).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 17).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -17).isActive = true
    }
}

extension InitialDataScreenViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3.2, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCard", for: indexPath) as! DataCard
        return cell
    }
}

extension InitialDataScreenViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTB", for: indexPath)
        cell.textLabel?.text = "Teste"
        return cell 
    }
    
    
}
