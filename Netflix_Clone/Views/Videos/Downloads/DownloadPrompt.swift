//
//  DownloadPrompt.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/19/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class DownloadPrompt : UIView {
    
    let imgDownload = ImageView(image: #imageLiteral(resourceName: "download_icon"))
    
    let lblDescription = Label()
    
    let btnSeeWhatYouCanDownload: Button = {
        let btn = Button()
        btn.setAttrTitle(title: "See What You Can Download", color: .black, fontSize: 18, bold: true)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 0
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.noAutoConst()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews(){
        
        let attrText =  NSMutableAttributedString(string: "Never be without Netflix \n\n", attributes: [NSAttributedString.Key.font: UIFont.appBoldFont(fSize: 26), NSAttributedString.Key.foregroundColor: UIColor.white])
        attrText.append(NSAttributedString(string: "Download shows and mobvies so you'll never be without something to watch -- even when you're offline.", attributes: [NSAttributedString.Key.font: UIFont.appFont(fSize:20), NSAttributedString.Key.foregroundColor: UIColor.white]))
        lblDescription.textAlignment = .center
        lblDescription.attributedText = attrText
        
        self.addSubview(imgDownload)
        self.addSubview(lblDescription)
        self.addSubview(btnSeeWhatYouCanDownload)
        imgDownload.addAnchor(top: self.topAnchor, 200, w: 200, h: 200)
        imgDownload.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lblDescription.addAnchor(left: self.leadingAnchor, 50, right: self.trailingAnchor, 50, top: imgDownload.bottomAnchor, 50)
        btnSeeWhatYouCanDownload.addAnchor(top: lblDescription.bottomAnchor, 50, w: 300, h: 50)
        btnSeeWhatYouCanDownload.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
}
