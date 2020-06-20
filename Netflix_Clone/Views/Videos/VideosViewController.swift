//
//  VideosViewController.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/15/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class VideosViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarOptions()
    }
    
    
    private func setupTabBarOptions(){
        self.view.backgroundColor = .rgba(r: 0, g: 0, b: 0, a: 1)
        
        viewControllers = [
            addNavigationCongtroller(vc: HomeViewController(), title: "Home", icon: #imageLiteral(resourceName: "tb_home")) ,
            addNavigationCongtroller(vc: SearchViewController(), title: "Search", icon: #imageLiteral(resourceName: "tb_search")) ,
            addNavigationCongtroller(vc: ComingSoonViewController(), title: "Coming Soon", icon: #imageLiteral(resourceName: "tb_coming_soon")) ,
            addNavigationCongtroller(vc: DownloadsViewController(), title: "Downloads", icon: #imageLiteral(resourceName: "tb_download")) ,
            addNavigationCongtroller(vc: MoreViewController(), title: "More", icon: #imageLiteral(resourceName: "tb_more"))
        ]
        
        tabBar.barTintColor =  UIColor.rgba(r: 10, g: 10, b: 10, a: 1)
        tabBar.tintColor = .white
        tabBar.isTranslucent = false
        UITabBar.appearance().backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 1)
    }
    
    private func addNavigationCongtroller(vc: UIViewController, title: String, icon: UIImage ) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = icon
        navController.navigationBar.isHidden = true
        return navController
    }
    
}
