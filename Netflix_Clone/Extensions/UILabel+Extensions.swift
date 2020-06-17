//
//  UILabel+Extensions.swift
//  AkbarTravels
//
//  Created by JAYANTA GOGOI on 3/12/20.
//  Copyright © 2020 Akbar Travels. All rights reserved.
//

import UIKit

class Label: UILabel{
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.noAutoConst()
            self.lineBreakMode = .byWordWrapping
            self.numberOfLines = 0
       }
    
    init(title: String, _ color: UIColor = .black,_ font: UIFont = .appFont(fSize: 16)) {
        super.init(frame: CGRect.zero)
        self.noAutoConst()
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 0
        self.text = title
        self.font = font
        self.textColor = color
        self.textAlignment = .center
        
    }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
    
}
