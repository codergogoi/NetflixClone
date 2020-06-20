//
//  SearchViewController.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/15/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

   
        let viewModel = HomeViewModel()
        
        let searchBar = SearchBarView()
        
        let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection =  .vertical
            let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collView.showsVerticalScrollIndicator = false
            collView.noAutoConst()
            return collView
        }()
        
        let identifier = "SearchVideoCell"
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupViews()
            self.searchBar.txtSearch.becomeFirstResponder()
        }
        
        private func setupViews(){
            
            searchBar.backgroundColor = .rgba(r: 0, g: 0, b: 0, a: 0.5)
            self.view.addSubview(searchBar)
            
            searchBar.onChangeText = {[weak self] txt in
                print("Entered \(txt)")
            }
            
            self.view.addSubview(collectionView)
            collectionView.register(SearchVideoCell.self, forCellWithReuseIdentifier: identifier)
            
            collectionView.delegate = self
            collectionView.dataSource = self
            
            searchBar.addAnchor(left: self.view.leadingAnchor, right: self.view.trailingAnchor, top: self.view.topAnchor, 44,h: 40)
            collectionView.addAnchor(left: self.view.leadingAnchor,  right: self.view.trailingAnchor, top: self.searchBar.bottomAnchor, 20, bottom: self.view.bottomAnchor, 10)
        }
        
    }



    //MARK: - Collection View Functionality

    extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
            
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 50
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SearchVideoCell
           
            return cell
           
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: collectionView.bounds.size.width, height: 80)
        }
        
    }


   
