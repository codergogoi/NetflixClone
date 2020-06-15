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
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
    
}
