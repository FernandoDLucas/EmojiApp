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

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundLayer = AnsBackground.gl
        backgroundLayer.frame = self.view.frame
        self.view.layer.addSublayer(backgroundLayer)
        let acessButton = UIBarButtonItem(title: "Acessar", style: .done, target: self, action: #selector(teste))
        self.navigationItem.rightBarButtonItem = acessButton
    }
    
    @objc func teste(){
        let sampleStoryBoard : UIStoryboard = UIStoryboard(name: "Answer", bundle:nil)
           let answerView  = sampleStoryBoard.instantiateViewController(withIdentifier: "AnswerScreenViewController") as! AnswerScreenViewController
        self.navigationController?.pushViewController(answerView, animated: true)    }
}
