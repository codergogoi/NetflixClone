//
//  AppPlayer.swift
//  UI_Components
//
//  Created by JAYANTA GOGOI on 5/4/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class AppPlayer: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeRight.rawValue
              UIDevice.current.setValue(value, forKey: "orientation")
        
        self.view.backgroundColor = .init(white: 0.9, alpha: 1)
                let videoPlayer = VideoPlayerView()
                videoPlayer.isUserInteractionEnabled = true
             
                 self.view.addSubview(videoPlayer)
                 videoPlayer.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
                 videoPlayer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
                 videoPlayer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
                videoPlayer.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        self.view.layoutIfNeeded()
    }
    
}

