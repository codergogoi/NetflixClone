//
//  SearchBarView.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/19/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class SearchBarView: UIView {
    
    var onChangeText: ((String?) -> ())?
    
    let txtSearch: UITextField = {
        let txt = TextField()
        txt.setPlaceHolder("Search", isBold: false, color: .rgba(r: 144, g: 144, b: 144, a: 1))
        return txt
    }()
    
    let btnCancel: Button = {
        let btn = Button()
        btn.backgroundColor = .clear
        btn.setAttrTitle(title: "Cancel", color: .white, fontSize: 16)
        return btn
    }()
    
    let searchIcon = ImageView(image: #imageLiteral(resourceName: "search_gray"))
    
    let placeholderView = View()
    
    var isHideCancel = false
    
    var widthConst = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.noAutoConst()
        setupViews()
        self.txtSearch.delegate = self
        self.txtSearch.enablesReturnKeyAutomatically = true
        self.txtSearch.returnKeyType = .done
        self.txtSearch.addTarget(self, action: #selector(onTextChange(sender:)), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews(){
        
        let bgView = View()
        bgView.layer.cornerRadius = 5
        bgView.backgroundColor = .rgba(r: 49, g: 50, b: 51, a: 1)
        self.addSubview(bgView)
        self.addSubview(btnCancel)
        btnCancel.addAnchor(right: self.trailingAnchor, 5, h: 40)
        widthConst = btnCancel.widthAnchor.constraint(equalToConstant: 80)
        btnCancel.addConstraint(widthConst)
        btnCancel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive =  true
        
        bgView.addAnchor(left: self.leadingAnchor, 5, right: btnCancel.leadingAnchor,top: self.topAnchor,3, bottom: self.bottomAnchor,3)
        btnCancel.addTarget(self, action: #selector(onTapCancel(_:)), for: .touchUpInside)
        
        bgView.addSubview(searchIcon)
        bgView.addSubview(txtSearch)
        bgView.addSubview(placeholderView)
        placeholderView.addAnchor(left: bgView.leadingAnchor, 5, right: bgView.trailingAnchor, 5, top: bgView.topAnchor, bottom: bgView.bottomAnchor)
        setupPlaceholder()
        placeholderView.isHidden = true
        searchIcon.addAnchor(left: bgView.leadingAnchor, 5, top: bgView.topAnchor, 5, bottom: bgView.bottomAnchor, 5, w: 20)
        txtSearch.addAnchor(left: searchIcon.trailingAnchor, right: bgView.trailingAnchor,5, top: bgView.topAnchor, bottom: bgView.bottomAnchor)
    }
    
    private func setupPlaceholder(){
        self.placeholderView.backgroundColor = .clear
        let searchIcon = ImageView(image: #imageLiteral(resourceName: "search_gray"))
        placeholderView.addSubview(searchIcon)
        let lbl = Label(title: "Search", .rgba(r: 144, g: 144, b: 144, a: 1), .appFont(fSize: 18))
        placeholderView.addSubview(lbl)
        searchIcon.addAnchor(w: 20, h: 20)
        searchIcon.centerYAnchor.constraint(equalTo: placeholderView.centerYAnchor).isActive = true
        searchIcon.centerXAnchor.constraint(equalTo: placeholderView.centerXAnchor, constant: -40).isActive = true
        lbl.addAnchor(left: searchIcon.trailingAnchor, 10)
        lbl.centerYAnchor.constraint(equalTo: placeholderView.centerYAnchor).isActive = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didChangeCancel))
        self.placeholderView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func onTapCancel(_ sender: UIButton) {
        sender.onTapAnimation()
        didChangeCancel()
    }
    
    @objc private func didChangeCancel(){
        self.isHideCancel = !self.isHideCancel
        self.widthConst.constant = self.isHideCancel ? 0 : 80
        self.btnCancel.isHidden = self.isHideCancel
       self.placeholderView.isHidden = !self.isHideCancel
       self.searchIcon.isHidden = self.isHideCancel
       self.txtSearch.isHidden = self.isHideCancel
        
        if !self.isHideCancel{
            txtSearch.becomeFirstResponder()
        }else{
            txtSearch.resignFirstResponder()
        }
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseInOut, animations: {
           
            self.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    @objc func onTextChange(sender: UITextField){
        self.onChangeText?(sender.text)
    }
}

extension SearchBarView : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtSearch.resignFirstResponder()
        
        return false
    }
    
}
