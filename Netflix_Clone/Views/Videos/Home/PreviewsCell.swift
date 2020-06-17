//
//  PreviewsCell.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/16/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class PreviewThumbCell: CollectionBaseCell {
    
    let imgThumb: ImageView = {
        let imgView = ImageView(image: #imageLiteral(resourceName: "mock_banner"))
        imgView.layer.masksToBounds = true
        return imgView
        
    }()
    
    let lblTitle = Label(title: "Money Heist", .white, .appBoldFont(fSize: 22))
    
    override func setupView() {
        
        self.addSubview(imgThumb)
        self.addSubview(lblTitle)
        self.imgThumb.addAnchor(left: self.leadingAnchor, 20, right: self.trailingAnchor, 20, top: self.topAnchor, 20, bottom: self.bottomAnchor, 20)
        self.imgThumb.layer.cornerRadius = (self.frame.size.width - 40) / 2
        self.imgThumb.layer.borderColor = UIColor.randomColor(0.5).cgColor
        self.imgThumb.layer.borderWidth = 3
        self.lblTitle.addCenterAnchor(centerX: self.centerXAnchor, bottom: self.bottomAnchor, 5)
        
    }
}


class PreviewsCell: CollectionBaseCell {
    
    let lblTitle = Label(title: "Previews", .white, .appBoldFont(fSize: 18))
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.noAutoConst()
        return collView
    }()
    
    let identifier = "thumbnailCell"
    
    override func setupView() {
        self.addSubview(lblTitle)
        self.addSubview(collectionView)
        self.lblTitle.addAnchor(left: self.leadingAnchor, 10, top: self.topAnchor, 10)
        self.collectionView.addAnchor(left: self.leadingAnchor, right: self.trailingAnchor, top: self.lblTitle.bottomAnchor,  bottom: self.bottomAnchor)
        self.collectionView.register(PreviewThumbCell.self, forCellWithReuseIdentifier: identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}


//MARK: - Collection View Functionality

extension PreviewsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PreviewThumbCell

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.bounds.size.height - 20, height: collectionView.bounds.size.height - 20)
    }


}
