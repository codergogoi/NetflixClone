//
//  MoreViewController.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/15/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
 
            let viewModel = MoreViewModel()
                        
            let collectionView: UICollectionView = {
                let layout = UICollectionViewFlowLayout()
                layout.scrollDirection =  .vertical
                let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
                collView.showsVerticalScrollIndicator = false
                collView.noAutoConst()
                return collView
            }()
            
            let identifierProfile = "profileDetails"
            let identifierOther = "otherFeatures"
            let identifierSignout = "signout"
    
            let footerView = View()
            
            override func viewDidLoad() {
                super.viewDidLoad()
                setupViews()
            }
            
            private func setupViews(){
                
                self.view.addSubview(collectionView)
                collectionView.register(MoreAddProfileCell.self, forCellWithReuseIdentifier: identifierProfile)
                collectionView.register(MoreCell.self, forCellWithReuseIdentifier: identifierOther)
                collectionView.register(SignoutCell.self, forCellWithReuseIdentifier: identifierSignout)
                collectionView.delegate = self
                collectionView.dataSource = self
                
                collectionView.addAnchor(left: self.view.leadingAnchor,  right: self.view.trailingAnchor, top: self.view.topAnchor, bottom: self.view.bottomAnchor, 10)
            }
            
        }



        //MARK: - Collection View Functionality

        extension MoreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
                
            func numberOfSections(in collectionView: UICollectionView) -> Int {
                return 1
            }
            
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return self.viewModel.numbersOfItemsForSection()
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                 
                if indexPath.row == 0 {
                     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierProfile, for: indexPath) as! MoreAddProfileCell
                    cell.didTapOnProfileItem = {[weak self] profile in
                        self?.onDidSelectProfile(profile: profile)
                    }
                    return cell
                }else if indexPath.row == (self.viewModel.numbersOfItemsForSection() - 1){
                    
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierSignout, for: indexPath) as! SignoutCell
                    return cell
                    
                }else{
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierOther, for: indexPath) as! MoreCell
                    cell.dataModel = self.viewModel.optionForIndex(index: indexPath.row)
                    return cell
                }
                
            }
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
                return CGSize(width: collectionView.bounds.size.width, height: indexPath.row == 0 ? 260 : 70)
                
            }
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                return 2
            }
            
        }

//MARK: - Callbacks
extension MoreViewController {
    
    fileprivate func onDidSelectProfile(profile: Profile?){
          
          if let selectedProfile = profile{
            print(selectedProfile)
            // move to video Tab
            self.tabBarController?.selectedIndex = 0
          }else{
              //Add New Profile UI
            print("Show Add New Profile UI")
          }
          
      }
    
    
}


       
