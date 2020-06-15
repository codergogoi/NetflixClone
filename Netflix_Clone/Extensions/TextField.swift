//
//  TextField.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 5/20/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class TextField: UITextField {

    let spaceInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    var isShowPassword = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 5
        self.backgroundColor = .rgba(r: 51, g:51, b:51, a: 1)
        self.bounds.inset(by: spaceInset)
        self.noAutoConst()
        self.textColor = .white
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setPlaceHolder(_ string: String, isBold: Bool = false, color: UIColor = UIColor.rgba(r: 160, g: 160, b: 160, a: 1)){
        self.attributedPlaceholder = NSAttributedString(string: string, attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: isBold ? UIFont.appBoldFont(fSize: 18) : UIFont.appFont(fSize: 18)])
    }
    
    func setupView(){
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: spaceInset)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: spaceInset)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: spaceInset)
    }
    
    func makePasswordField(){
        let btnShowHide = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 50))
        btnShowHide.setTitle("SHOW", for: .normal)
        btnShowHide.setTitleColor(.white, for: .normal)
        self.leftView = btnShowHide
        
    }

}
