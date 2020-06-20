//
//  MoreAddProfileCell.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/20/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit
 

class MoreAddProfileCell: CollectionBaseCell {
    
    var viewModel = ProfileViewModel()
    
    var didTapOnProfileItem: ((Profile?)->())?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.noAutoConst()
        collView.showsHorizontalScrollIndicator = false
        return collView
    }()
    
    let identifier = "profileIdentifier"
    
    let btnManageProfile: IconButtonHorizontal = {
        let btn = IconButtonHorizontal()
        btn.icon.image = #imageLiteral(resourceName: "edit")
        btn.lblTitle.text = "Manage Profile"
        btn.lblTitle.textColor = .white
        btn.backgroundColor = .clear
        return btn
    }()
    
    
    override func setupView() {
       
        self.addSubview(collectionView)
        self.addSubview(btnManageProfile)
        collectionView.register(ProfileCard.self, forCellWithReuseIdentifier: identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.addAnchor(left: self.leadingAnchor, right: self.trailingAnchor, top: self.topAnchor, 10, h: 120)
        self.btnManageProfile.addAnchor(top: collectionView.bottomAnchor, 50, w: 320, h: 50)
        self.btnManageProfile.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.btnManageProfile.addTarget(self, action: #selector(onTapManageProfile(_:)), for: .touchUpInside)
    }
    
    @objc func onTapManageProfile(_ sender: UIButton){
           sender.onTapAnimation()
    }
      
  
    
}


//MARK: - Collection View Functionality

extension MoreAddProfileCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.profileCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProfileCard
        cell.dataModel = self.viewModel.profileForIndex(index: indexPath.row)
        cell.didTapSelectProfile = {[weak self] profile in
            self?.didTapOnProfileItem?(profile)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width / 4, height: collectionView.bounds.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
