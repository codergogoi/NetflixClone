//
//  LoginViewController.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 5/20/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    
    let netflixLogo: UIImageView  = {
        let img = UIImageView(image: #imageLiteral(resourceName: "netflix_word"))
        img.contentMode = .scaleAspectFit
        img.noAutoConst()
        return img
        
    }()
    
    let txtLogin : TextField = {
        let txt = TextField()
        txt.setPlaceHolder("Email or Phone Number")
        return txt
    }()
    
    let txtPassword : TextField = {
        let txt = TextField()
        txt.setPlaceHolder("Password")
        txt.isSecureTextEntry = true
        return txt
    }()
    
    let loginButton: Button = {
        let btn = Button()
        btn.setAttrTitle(title: "SIGN IN", color: .white, fontSize: 16, bold: true)
        btn.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)
        return btn
    }()
    
    let backToHome: Button = {
        let btn = Button()
        btn.setImage(#imageLiteral(resourceName: "back_arrow copy"), for: .normal)
        btn.backgroundColor = .none
        btn.addTarget(self, action: #selector(onTapBackToHome), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .rgba(r: 0, g: 0, b: 0, a: 1)
        self.loginButton.isEnabled = true
        self.view.addSubview(txtLogin)
        self.view.addSubview(txtPassword)
        self.view.addSubview(loginButton)
        self.view.addSubview(netflixLogo)
        self.view.addSubview(backToHome)
        
        txtLogin.addCenterAnchor(centerX: self.view.centerXAnchor, centerY: nil, top: nil, nil, bottom: nil, nil, w: self.view.bounds.width - 100, h: 50)
        
        txtLogin.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
            .isActive = true
        txtPassword.addCenterAnchor(centerX: self.view.centerXAnchor, centerY: nil, top: self.txtLogin.bottomAnchor , 20, bottom: nil, nil, w: self.view.bounds.width - 100, h: 50)
        loginButton.addCenterAnchor(centerX: self.view.centerXAnchor, centerY: nil, top: self.txtPassword.bottomAnchor, 50, bottom: nil, nil, w: self.view.bounds.width - 100, h: 50)
        txtPassword.makePasswordField()
        netflixLogo.addCenterAnchor(centerX: self.view.centerXAnchor, centerY: nil, top: self.view.topAnchor, 50, bottom: nil, nil, w: self.view.bounds.width / 3, h: 30)
        backToHome.addAnchor(left: self.view.leadingAnchor, 10, right: nil, nil, top: self.view.topAnchor, 40, bottom: nil, nil, w: 30, h: 42)
    }
    
    @objc func onTapLogin() {
        let profileViewController = ProfileSelectionViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
        
    }
    
    @objc func onTapBackToHome(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
