//
//  TopForTheDay.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/16/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class TopForTheDayCell : CollectionBaseCell {

    let imgBannerView: ImageView = {
       let img = ImageView(image: #imageLiteral(resourceName: "mock_banner"))
        return img
    }()
    
    let lblTitle: Label = {
        let lbl = Label()
        lbl.textColor = .white
        lbl.font = .appBoldFont(fSize: 60)
        lbl.text = "Money\n Heist"
        lbl.textAlignment = .center
        return lbl
    }()
    
    let lblVideoCategory: Label = {
        let lbl = Label()
        lbl.textColor = .white
        lbl.font = .appFont(fSize: 12)
        lbl.text = "Suspensful • Exciting • Thriller • Ensemble • heist "
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    let btnAddToList: IconButton = {
        let btn = IconButton()
        btn.lblTitle.text = "My List"
        btn.icon.image = #imageLiteral(resourceName: "add_icon")
        return btn
    }()

    let btnPlay: IconButtonVertical = {
        let btn = IconButtonVertical()
        btn.lblTitle.text = "Play"
        btn.icon.image = #imageLiteral(resourceName: "play_black")
        return btn
    }()
    
    let btnInfo : IconButton = {
        let btn = IconButton()
        btn.lblTitle.text = "Info"
        btn.icon.image = #imageLiteral(resourceName: "info_icon")
        return btn
    }()
    
    
    //actions
    var didTapPlay:(()->())?
    
    
    
    override func setupView() {
        super.setupView()
        backgroundColor = .red
        self.addSubview(imgBannerView)
        self.addSubview(lblTitle)
        self.addSubview(lblVideoCategory)
        self.addSubview(btnAddToList)
        self.addSubview(btnPlay)
        self.addSubview(btnInfo)
        
        imgBannerView.addAnchor(left: self.leadingAnchor, right: self.trailingAnchor, top: self.topAnchor, bottom: self.bottomAnchor)
        self.lblTitle.addCenterAnchor(centerX: self.centerXAnchor, bottom: self.lblVideoCategory.topAnchor)
        self.lblVideoCategory.addCenterAnchor(centerX: self.centerXAnchor, bottom: self.btnPlay.topAnchor, 20, h: 12)
        
        btnPlay.addCenterAnchor(centerX: self.centerXAnchor, bottom: self.bottomAnchor, 10, w: 140, h: 40)
        btnAddToList.addAnchor(left: self.leadingAnchor, 50, w: 60, h: 60)
        btnAddToList.centerYAnchor.constraint(equalTo: btnPlay.centerYAnchor).isActive = true
        btnInfo.addAnchor(left: nil, nil, right: self.trailingAnchor, 50, w: 60, h: 60)
        btnInfo.centerYAnchor.constraint(equalTo: btnPlay.centerYAnchor).isActive = true
        btnPlay.addTarget(self, action: #selector(onTapPlay(_:)), for: .touchUpInside)

    }
    
    
    @objc func onTapPlay(_ sender: UIButton){
        sender.onTapAnimation()
        self.didTapPlay?()
    }
}
