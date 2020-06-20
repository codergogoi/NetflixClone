//
//  MoreCell.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/19/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class MoreCell: CollectionBaseCell {
        
        var dataModel: MoreOption?{
            didSet{
                if let dataModel = dataModel{
                    self.imgIcon.image = dataModel.icon
                    self.lblTitle.text = dataModel.title
                }
            }
        }
    
        let imgIcon = ImageView(image: #imageLiteral(resourceName: "check"))
    
        let lblTitle = Label(title: "", .white, .appFont(fSize: 18))
        
        let imgInfo = ImageView(image: #imageLiteral(resourceName: "arrow_next"))
    
        override func setupView() {
            self.backgroundColor = .rgba(r: 17, g: 18, b: 19, a: 1)
            self.addSubview(imgIcon)
            self.addSubview(lblTitle)
            self.addSubview(imgInfo)
            
            lblTitle.textAlignment = .left
            lblTitle.textColor = .white

            imgIcon.addAnchor(left: self.leadingAnchor, 10, w: 30, h: 30)
            imgIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            lblTitle.addAnchor(left: imgIcon.trailingAnchor, 20)
            lblTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            imgInfo.addAnchor(right: self.trailingAnchor, 10, w: 20, h: 20)
            imgInfo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        }

        
    }

