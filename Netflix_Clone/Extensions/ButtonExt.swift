//
//  ButtonExt.swift
//  AkbarTravels
//
//  Created by MAC01 on 15/01/18.
//  Copyright © 2018 Akbar Travels. All rights reserved.
//

import UIKit


class Button: UIButton {
 
    override var isEnabled: Bool{
        didSet{
            if isEnabled{
                self.backgroundColor = .rgba(r: 210, g: 40, b: 39, a: 1)
                self.layer.cornerRadius = 5
                self.layer.borderWidth = 0
            }else{
                self.backgroundColor = .rgba(r: 0, g: 0, b: 0, a: 1)
                self.layer.cornerRadius = 5
                self.layer.borderWidth = 0.5
                self.layer.borderColor = UIColor.rgba(r: 51, g:51, b:51, a: 1).cgColor
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.noAutoConst()
        self.backgroundColor = .rgba(r: 210, g: 40, b: 39, a: 1)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
    func setAttrTitle(title: String, color: UIColor = .white, fontSize: Float = 16, bold: Bool = false){
        
        let attrText = NSMutableAttributedString(string: "\(title)", attributes: [NSAttributedString.Key.font: (bold ? UIFont.appBoldFont(fSize: fontSize) : UIFont.appFont(fSize: fontSize)), NSAttributedString.Key.foregroundColor: color])
        
        self.setAttributedTitle(attrText, for: .normal)
        
    }
    
}

extension UIButton{
    
    func imgButton(title: String, imgName: UIImage, size:(w: Int,h:Int), fontSize: Int){
        let textAttachment = NSTextAttachment()
        textAttachment.image = imgName
        textAttachment.bounds = CGRect(x: 0, y: -2, width: size.w, height: size.h)
        
        let font =  UIFont(name: "RobotoCondensed-Regular", size: CGFloat(fontSize))!
        
        let attrubutedText = NSMutableAttributedString(string:title, attributes: [NSAttributedString.Key.font: font])
        attrubutedText.append(NSAttributedString(attachment: textAttachment))
        self.setAttributedTitle(attrubutedText, for: .normal)
    }
    
}
