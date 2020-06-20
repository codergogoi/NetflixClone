//
//  ComingSoonCell.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/19/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class ComingSoonCell: CollectionBaseCell {
    
    let imgThumb: ImageView = {
        let imgView = ImageView(image: #imageLiteral(resourceName: "mock_banner"))
        imgView.contentMode = .scaleToFill
        return imgView
        
    }()
        
    let lblTitle = Label(title: "Money Heist", .white, .appBoldFont(fSize: 30))
    
    let btnRemindMe: IconButton = {
        let btn = IconButton()
        btn.icon.image = #imageLiteral(resourceName: "info_icon")
        btn.lblTitle.text = "Remind Me"
        return btn
    }()
    
    let btnInfo: IconButton = {
           let btn = IconButton()
           btn.icon.image = #imageLiteral(resourceName: "info_icon")
        btn.lblTitle.text = "Info"
           return btn
    }()
       
    let lblWhenComing = Label(title: "Coming Wednesday", .rgba(r: 144, g: 144, b: 144, a: 1), .appFont(fSize: 13))
    
    let lblBriefStory = Label()
    
    let lblVideoCategory = Label(title: "Unsettling • Thriller • Comedy • supernatural ", .white, .appFont(fSize: 13))
    
    override func setupView() {
        
        self.addSubview(imgThumb)
        self.addSubview(lblTitle)
        self.addSubview(btnRemindMe)
        self.addSubview(btnInfo)
        self.addSubview(lblWhenComing)
        self.addSubview(lblBriefStory)
        self.addSubview(lblVideoCategory)
        
        lblTitle.textAlignment = .left
        lblTitle.textColor = .white
        
        lblBriefStory.attributedText = setBriefStory(title: "Money Heist", content: "An exceptional story representing a pre planned scam which took a wrong turn because of a smart master mind cop.")
        
        self.imgThumb.addAnchor(left: self.leadingAnchor, right: self.trailingAnchor, top: self.topAnchor, h: 300)
        self.lblTitle.addAnchor(left: self.leadingAnchor, 20,top:imgThumb.bottomAnchor, 10)
        
        self.btnInfo.addAnchor(right: self.trailingAnchor, 20, top: lblTitle.topAnchor, w: 40,  h: 40)
        self.btnRemindMe.addAnchor(right: btnInfo.leadingAnchor,20, top: lblTitle.topAnchor, w: 40, h: 40)
        
        self.lblWhenComing.addAnchor(left: self.leadingAnchor, 20, top: lblTitle.bottomAnchor, 20)
        self.lblBriefStory.addAnchor(left: self.leadingAnchor, 20, right: self.trailingAnchor, 10, top: self.lblWhenComing.bottomAnchor, 20)
        self.lblVideoCategory.addAnchor(left: self.leadingAnchor, 20, right: self.trailingAnchor, 10, top: lblBriefStory.bottomAnchor, 20)
        
    }

    private func setBriefStory(title: String, content: String) -> NSAttributedString {
        
        let attrString = NSMutableAttributedString(string: "\(title)\n", attributes: [NSAttributedString.Key.font: UIFont.appBoldFont(fSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white])
        
        attrString.append(NSAttributedString(string: content, attributes: [NSAttributedString.Key.font: UIFont.appFont(fSize: 16), NSAttributedString.Key.foregroundColor: UIColor.rgba(r: 144, g: 144, b: 144, a: 1)]))
        
        return attrString
    }
    
}

