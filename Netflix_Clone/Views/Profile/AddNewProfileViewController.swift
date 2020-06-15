//
//  AddNewProfileViewController.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/15/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class AddNewProfileViewController: UIViewController {

    let btnSave = Button()
    let btnCancel = Button()
    let imgProfileIcon = ImageView(image: #imageLiteral(resourceName: "add_profile"))
    let txtProfileName = TextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func setupViews(){
        self.view.addSubview(btnSave)
        self.view.addSubview(btnCancel)
        self.view.addSubview(imgProfileIcon)
        self.view.addSubview(txtProfileName)
    }
    

}
