//
//  InitialScreen.swift
//  EmojiApp
//
//  Created by Fernando de Lucas da Silva Gomes on 19/08/20.
//  Copyright © 2020 Fernando de Lucas da Silva Gomes. All rights reserved.
//

import UIKit


class InitialAnswerScreenViewController : UIViewController {
    
    let AnsBackground = SecBackgroundGradient()

    let labelId : UITextField = {
        let labelId = UITextField()
        labelId.placeholder = "ID do Questionário"
        labelId.backgroundColor = .white
        labelId.textAlignment = .center
        return labelId
    }()
    
    let optionsLabel : UILabel = {
        let optionsLabel = UILabel()
        optionsLabel.text = "Opções de Configuração"
        optionsLabel.textColor = .white
        return optionsLabel
    }()
    
    let tableView : UITableView = {
        let tableview = UITableView()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundLayer = AnsBackground.gl
        backgroundLayer.frame = self.view.frame
        self.view.layer.addSublayer(backgroundLayer)
        let acessButton = UIBarButtonItem(title: "Acessar", style: .done, target: self, action: #selector(teste))
        self.navigationItem.rightBarButtonItem = acessButton
        setIdTextField()
        setTableView()
    }
    
    
    func setIdTextField(){
        self.view.addSubview(labelId)
        labelId.translatesAutoresizingMaskIntoConstraints = false
        labelId.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 160).isActive = true
        labelId.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelId.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        self.view.addSubview(optionsLabel)
        optionsLabel.translatesAutoresizingMaskIntoConstraints = false
        optionsLabel.topAnchor.constraint(equalTo: labelId.bottomAnchor, constant: 17).isActive = true
        optionsLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        optionsLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        optionsLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 17).isActive = true
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: optionsLabel.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    func setTableView() {
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    @objc func teste(){
        let sampleStoryBoard : UIStoryboard = UIStoryboard(name: "Answer", bundle:nil)
           let answerView  = sampleStoryBoard.instantiateViewController(withIdentifier: "AnswerScreenViewController") as! AnswerScreenViewController
        self.navigationController?.pushViewController(answerView, animated: true)
        
    }
}


extension InitialAnswerScreenViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "Responder Anonimamente"
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        let switchButton = UISwitch(frame: .zero)
        switchButton.tag = indexPath.row
        cell.accessoryView = switchButton
        return cell
    }
    


}
