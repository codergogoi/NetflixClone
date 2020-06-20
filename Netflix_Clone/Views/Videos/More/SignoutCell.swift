//
//  SignoutCell.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/20/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class SignoutCell: CollectionBaseCell {
    
    let btnSignout = Button()
    let lblVersionDetails = Label(title: "Version: 1.0.0", .darkGray, .appFont(fSize: 20))
    
    override func setupView() {
        
        btnSignout.setAttrTitle(title: "Sign Out", color: .white, fontSize: 20)
        btnSignout.backgroundColor = .clear
        
        self.addSubview(btnSignout)
        self.addSubview(lblVersionDetails)
        
        self.btnSignout.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.btnSignout.addAnchor(top: self.topAnchor, 10, w: 320, h: 40)
        self.lblVersionDetails.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.lblVersionDetails.addAnchor(top: btnSignout.bottomAnchor)
        btnSignout.addTarget(self, action: #selector(onTapSignout(_:)), for: .touchUpInside)
        
    }
    
    @objc func onTapSignout(_ sender: UIButton){
        sender.onTapAnimation()
    }
    
}
