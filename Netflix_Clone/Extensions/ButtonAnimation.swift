//
//  ButtonAnimation.swift
//  AkbarTravels
//
//  Created by MAC01 on 13/09/17.
//  Copyright © 2017 Akbar Travels. All rights reserved.
//

import UIKit


extension UIButton{

    func onTapAnimation(){
        
        DispatchQueue.main.async {
            let anim = CAKeyframeAnimation(keyPath: "transform.scale")
            anim.values = [0.9,0.8,1.1,1.0]
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3
            self.layer.add(anim, forKey:"scale")
        }
 
    }
    
}

 
