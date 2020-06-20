//
//  HomeViewController.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/15/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    let viewModel = HomeViewModel()
    
    let topNavbar = HomeTopNav()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection =  .vertical
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.showsVerticalScrollIndicator = false
        collView.contentInset = UIEdgeInsets(top: -42, left: 0, bottom: 0, right: 0)
        collView.noAutoConst()
        return collView
    }()
    
    let identifierTopForTheDay = "topForTheDay"
    let identifierPreview = "previews"
    let identifierListed = "listedVideos"
    let identifierOriginals = "netflixOriginal"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupViews(){
        self.view.addSubview(collectionView)
        self.view.addSubview(topNavbar)

        collectionView.register(TopForTheDayCell.self, forCellWithReuseIdentifier: identifierTopForTheDay)
        collectionView.register(PreviewsCell.self, forCellWithReuseIdentifier: identifierPreview)
        collectionView.register(ListedVideoCell.self, forCellWithReuseIdentifier: identifierListed)
        collectionView.register(OriginalVideosCell.self, forCellWithReuseIdentifier: identifierOriginals)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        topNavbar.addAnchor(left: self.view.leadingAnchor, right: self.view.trailingAnchor, top: self.view.topAnchor, 20,h: 73)
        collectionView.addAnchor(left: self.view.leadingAnchor, nil, right: self.view.trailingAnchor, nil, top: self.view.topAnchor, 0, bottom: self.view.bottomAnchor, 10)
    }
    
}

//MARK: - Collection View Functionality

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierTopForTheDay, for: indexPath) as! TopForTheDayCell
            cell.didTapPlay = {[weak self] in
                self?.onTapPlay()
            }
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierPreview, for: indexPath) as! PreviewsCell
            return cell
        case 2:
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierListed, for: indexPath) as! ListedVideoCell
           return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierOriginals, for: indexPath) as! OriginalVideosCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width, height: indexPath.section == 0 ? self.view.frame.size.height / 1.3 : (indexPath.section == 1 ? 200 : (indexPath.section == 3 ? 320 : 220)))
    }
    
}


//MARK: - CallBack Actions

extension HomeViewController {
    
    
    fileprivate func onTapPlay() {
        
        let appPlayer = AppPlayer()
        self.present(appPlayer, animated: true, completion: nil)
    }
    
}
