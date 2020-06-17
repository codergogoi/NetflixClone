//
//  PreviewsCell.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/16/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class ListedThumbCell: CollectionBaseCell {
    
    let imgThumb: ImageView = {
        let imgView = ImageView(image: #imageLiteral(resourceName: "mock_banner"))
        imgView.contentMode = .scaleToFill
        return imgView
        
    }()
    
 
    override func setupView() {
        self.backgroundColor = .green
        self.addSubview(imgThumb)
        self.imgThumb.addAnchor(left: self.leadingAnchor, right: self.trailingAnchor, top: self.topAnchor, bottom: self.bottomAnchor)
 
    }
}


class ListedVideoCell: CollectionBaseCell {
    
    let lblTitle = Label(title: "Trending Now", .white, .appBoldFont(fSize: 18))
    
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
        self.collectionView.addAnchor(left: self.leadingAnchor, right: self.trailingAnchor, top: self.lblTitle.bottomAnchor, 20,  bottom: self.bottomAnchor)
        self.collectionView.register(ListedThumbCell.self, forCellWithReuseIdentifier: identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
}


//MARK: - Collection View Functionality

extension ListedVideoCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ListedThumbCell

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 120, height: collectionView.frame.height)
    }
   


}
