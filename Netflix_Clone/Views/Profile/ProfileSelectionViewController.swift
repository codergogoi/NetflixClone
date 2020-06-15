//
//  ProfileSelectionViewController.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/15/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class ProfileSelectionViewController: UIViewController {
    
    
    
    let viewModel = ProfileViewModel()
    
    
    
    //MARK: - UI Controlles
    let profileCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection =  .vertical
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.noAutoConst()
        return collView
    }()
    
    let cardIdentifier = "ProfileCard"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .rgba(r: 0, g: 0, b: 0, a: 1)
        setupViews()
    }
    
    private func setupViews(){
        self.view.addSubview(profileCollectionView)
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        profileCollectionView.register(ProfileCard.self, forCellWithReuseIdentifier: cardIdentifier)
        profileCollectionView.addAnchor(left: self.view.leadingAnchor, 70, right: self.view.trailingAnchor, 70, top: self.view.topAnchor, 200, bottom: self.view.bottomAnchor, 10)
        
    }
    

}


//MARK: - Collection View Functionality

extension ProfileSelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.profileCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cardIdentifier, for: indexPath) as! ProfileCard
        cell.dataModel = viewModel.profileForIndex(index: indexPath.row)
        cell.didTapSelectProfile = {[weak self] profile in
            self?.onDidSelectProfile(profile: profile)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width / 2.1, height: collectionView.bounds.size.width / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
   
}

extension ProfileSelectionViewController {
    
    fileprivate func onDidSelectProfile(profile: Profile?){
        
        if let selectedProfile = profile{
            self.viewModel.selectProfileToWatch(profile: selectedProfile)
            let videosViewController = VideosViewController()
            videosViewController.modalPresentationStyle = .overFullScreen
            videosViewController.modalTransitionStyle = .crossDissolve
            self.present(videosViewController, animated: true, completion: nil)
        }else{
            self.onAddNewProfile()
        }
        
    }
    
    fileprivate func onAddNewProfile(){
        
    }
    
    
}
