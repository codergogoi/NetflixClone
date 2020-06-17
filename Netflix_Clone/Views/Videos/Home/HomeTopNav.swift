//
//  HomeTopNav.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/17/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class HomeTopNav: UIView {
    
    let imgLogo = ImageView(image: #imageLiteral(resourceName: "logo"))
    let btnTvShow: Button = {
        let btn = Button()
        btn.setAttrTitle(title: "TV Shows", color: .white, fontSize: 16, bold: true)
        btn.backgroundColor = .clear
        return btn
    }()
    
    let btnMovies : Button = {
        let btn = Button()
        btn.setAttrTitle(title: "Movies", color: .white, fontSize: 16, bold: true)
        btn.backgroundColor = .clear
        return btn
    }()
    
    let btnMyList : Button = {
        let btn = Button()
        btn.setAttrTitle(title: "My List", color: .white, fontSize: 16, bold: true)
        btn.backgroundColor = .clear
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
    
    func setupViews() {
        self.addSubview(imgLogo)
        
        let stackView = UIStackView(arrangedSubviews: [btnTvShow, btnMovies, btnMyList])
        stackView.alignment  = .fill
        stackView.distribution = .equalSpacing
        stackView.noAutoConst()
        self.addSubview(stackView)
        imgLogo.addAnchor(left: self.leadingAnchor, 20, top: self.topAnchor, 20, bottom: self.bottomAnchor, w: 20)
        stackView.addAnchor(left: self.imgLogo.trailingAnchor, 50, right: self.trailingAnchor, 50, h: 40)
        stackView.centerYAnchor.constraint(equalTo: imgLogo.centerYAnchor).isActive = true
        
        btnTvShow.addTarget(self, action: #selector(onTapAction(_:)), for: .touchUpInside)
        btnMovies.addTarget(self, action: #selector(onTapAction(_:)), for: .touchUpInside)
        btnMyList.addTarget(self, action: #selector(onTapAction(_:)), for: .touchUpInside)
        
    }
    
    @objc func onTapAction(_ sender: UIButton){
        sender.onTapAnimation()
        
    }
    
}
