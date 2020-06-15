//
//  File.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/15/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class ImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews(){
        self.contentMode = .scaleAspectFit
        self.noAutoConst()
    }
    
}
