//
//  ProfileCard.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/15/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class ProfileCard: CollectionBaseCell {
    
    //Set Data
    var dataModel: Profile?{
        didSet{
            if let dataModel = dataModel{
                profileBg.layer.backgroundColor = UIColor.randomColor().cgColor
                lblProfileName.text = dataModel.title
                profileIcon.image = #imageLiteral(resourceName: "smile_white")
            }else{
                lblProfileName.text = "Add Profile"
                profileIcon.image = #imageLiteral(resourceName: "add_profile")
            }
        }
    }
    
    //Invoke Callback
    var didTapSelectProfile:((Profile?)->())?
    
    // UI Controlls
    let lblProfileName = Label()
    
    let profileIcon : UIImageView = {
        let img = UIImageView()
        img.noAutoConst()
        img.image = #imageLiteral(resourceName: "add_profile")
        return img
    }()
    
    let profileBg = View()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setViews(){
        profileBg.layer.cornerRadius = 10
        profileBg.layer.backgroundColor = UIColor.clear.cgColor
        addSubview(profileBg)
        profileBg.addSubview(profileIcon)
        addSubview(lblProfileName)
        lblProfileName.textColor = .white
        lblProfileName.font = .appFont(fSize: 16)
        lblProfileName.textAlignment = .center
        
        profileBg.addAnchor(left: self.leadingAnchor, 10, right: self.trailingAnchor, 10, top: self.topAnchor, nil, bottom: self.bottomAnchor, 30, w: nil, h: nil)
        profileIcon.addAnchor(left: profileBg.leadingAnchor, nil, right: profileBg.trailingAnchor, nil, top: profileBg.topAnchor, nil, bottom: profileBg.bottomAnchor, nil)
        
        lblProfileName.addCenterAnchor(centerX: self.centerXAnchor, centerY: nil, top: nil, nil, bottom: self.bottomAnchor, nil, w: self.bounds.width, h: 30)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapSelectProfile))
        self.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func onTapSelectProfile(){
        self.didTapSelectProfile?(self.dataModel)
    }
    
}
