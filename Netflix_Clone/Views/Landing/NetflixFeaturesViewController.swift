//
//  NetflixFeaturesViewController.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 5/25/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class NetflixFeaturesViewController: UIViewController {
    
    var dataModel: LandingFeature?{
        didSet{
            if let dataModel = dataModel{
                if let imgIcon = dataModel.imgIcon{
                    imgFeatureIcon.image = imgIcon
                    imgBgView.image = nil
                }else{
                    imgBgView.image = #imageLiteral(resourceName: "mobilebg")
                }
                lblHeadLine.text = dataModel.headline
                lblDescription.text = dataModel.description
            }
        }
    }
    
    let imgFeatureIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.noAutoConst()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let lblHeadLine = Label()
    let lblDescription = Label()
    
    let imgBgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "mobilebg")
        imgView.contentMode = .scaleToFill
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .rgba(r: 0, g: 0, b: 0, a: 1)
        self.setupViews()
    }
    
    func setupViews(){
        self.view.layer.insertSublayer(UIColor.gradientBg(self.view), at: 0)

        lblHeadLine.textAlignment = .center
        lblHeadLine.font = .boldSystemFont(ofSize: 40)
        lblHeadLine.textColor = .white
        lblDescription.textAlignment = .center
        lblDescription.textColor = .white
        lblDescription.font = .systemFont(ofSize: 23)
        imgBgView.frame = view.frame
        view.addSubview(imgBgView)
        

        
        view.addSubview(imgFeatureIcon)
        view.addSubview(lblHeadLine)
        view.addSubview(lblDescription)
        imgFeatureIcon.addCenterAnchor(centerX: view.centerXAnchor, centerY: nil, top: view.topAnchor, 100, bottom: nil, nil, w: 300, h: 300)
        lblHeadLine.addCenterAnchor(centerX: view.centerXAnchor, centerY: nil, top: imgFeatureIcon.bottomAnchor, 10, bottom: nil, nil, w: 300, h: nil)
        lblDescription.addCenterAnchor(centerX: view.centerXAnchor, centerY: nil, top: lblHeadLine.bottomAnchor, 30, bottom: nil, nil, w: 300, h: nil)
        
        view.sendSubviewToBack(imgBgView)
               
    }
    
}
