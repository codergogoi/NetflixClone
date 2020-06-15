//
//  ViewController.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 5/20/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  

      let btn = Button()
    //
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.addSubview(btn)
            btn.backgroundColor = .blue
            btn.setTitle("Play", for: .normal)
            btn.addTarget(self, action: #selector(onPlayVideo), for: .touchUpInside)
            self.view.addSubview(btn)
            btn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
            btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
            btn.widthAnchor.constraint(equalToConstant: 300).isActive = true
            btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
           
        }
        
        @objc func onPlayVideo() {
            let appPlayer = AppPlayer()
            self.present(appPlayer, animated: true, completion: nil)
        }
        
        override func viewDidAppear(_ animated: Bool) {
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        }
        
        
        
}


