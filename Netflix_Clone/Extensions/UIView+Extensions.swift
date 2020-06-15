//
//  UIView+Extensions.swift
//  AkbarTravels
//
//  Created by JAYANTA GOGOI on 3/12/20.
//  Copyright © 2020 Akbar Travels. All rights reserved.
//

import UIKit

class View: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        noAutoConst()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
  
    
}
