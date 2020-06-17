//
//  SearchVideoCell.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/17/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class SearchVideoCell: CollectionBaseCell {
    
    
    let imgThumb: ImageView = {
        let imgView = ImageView(image: #imageLiteral(resourceName: "mock_banner"))
        imgView.contentMode = .scaleToFill
        return imgView
        
    }()
    
    let imgMoreDetails = ImageView(image: #imageLiteral(resourceName: "play_white"))
    
    let lblTitle = Label(title: "Money Heist", .white, .appBoldFont(fSize: 22))
    
    override func setupView() {
        
        self.addSubview(imgThumb)
        self.addSubview(lblTitle)
        self.addSubview(imgMoreDetails)
        lblTitle.textAlignment = .left
        lblTitle.textColor = .lightGray
        lblTitle.font = .appFont(fSize: 16)
        self.imgThumb.addAnchor(left: self.leadingAnchor, top: self.topAnchor, bottom: self.bottomAnchor, w: 160)
        self.lblTitle.addAnchor(left: self.imgThumb.trailingAnchor, 10)
        self.lblTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.imgMoreDetails.addAnchor( right: self.trailingAnchor, 20, w: 32, h: 32)
        self.imgMoreDetails.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    
}
