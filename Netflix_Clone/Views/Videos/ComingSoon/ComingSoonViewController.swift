//
//  ComingSoonViewController.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/15/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class ComingSoonViewController: UIViewController {
       
            let viewModel = HomeViewModel()
                        
            let collectionView: UICollectionView = {
                let layout = UICollectionViewFlowLayout()
                layout.scrollDirection =  .vertical
                let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
                collView.showsVerticalScrollIndicator = false
                collView.noAutoConst()
                return collView
            }()
            
            let identifier = "comingSoonCell"
            
            override func viewDidLoad() {
                super.viewDidLoad()
                setupViews()
            }
            
            private func setupViews(){
                
               
                self.view.addSubview(collectionView)
                collectionView.register(ComingSoonCell.self, forCellWithReuseIdentifier: identifier)
                
                collectionView.delegate = self
                collectionView.dataSource = self
                
                collectionView.addAnchor(left: self.view.leadingAnchor,  right: self.view.trailingAnchor, top: self.view.topAnchor, bottom: self.view.bottomAnchor, 10)
            }
            
        }



        //MARK: - Collection View Functionality

        extension ComingSoonViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
                
            func numberOfSections(in collectionView: UICollectionView) -> Int {
                return 1
            }
            
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return 50
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                 
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ComingSoonCell
               
                return cell
               
            }
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
                return CGSize(width: collectionView.bounds.size.width, height: 500)
            }
            
        }


       
