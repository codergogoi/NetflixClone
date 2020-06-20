//
//  DownloadsViewController.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/15/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class DownloadsViewController: UIViewController {
    
            let downloadPrompt = DownloadPrompt()
    
            let viewModel = HomeViewModel()
                        
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
            }
            
            private func setupViews(){
                
                self.view.addSubview(collectionView)
                collectionView.register(SearchVideoCell.self, forCellWithReuseIdentifier: identifier)
                
                collectionView.delegate = self
                collectionView.dataSource = self
                
                collectionView.addAnchor(left: self.view.leadingAnchor,  right: self.view.trailingAnchor, top: self.view.topAnchor, 20, bottom: self.view.bottomAnchor, 10)
                
                self.view.addSubview(downloadPrompt)
                downloadPrompt.addAnchor(left: view.leadingAnchor, right: view.trailingAnchor, top: view.topAnchor, bottom: view.bottomAnchor)
            }
            
        }



        //MARK: - Collection View Functionality

        extension DownloadsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
                
            func numberOfSections(in collectionView: UICollectionView) -> Int {
                return 1
            }
            
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return 0
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                 
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SearchVideoCell
               
                return cell
               
            }
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
                return CGSize(width: collectionView.bounds.size.width, height: 80)
            }
            
        }


       
