//
//  LandingViewController.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 5/20/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit



class LandingViewController: UIViewController {
    
    let loginButton: Button = {
        let btn = Button()
        btn.setAttrTitle(title: "SIGN IN", color: .white, fontSize: 16)
        btn.backgroundColor = .rgba(r: 210, g: 40, b: 39, a: 1)
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)
        return btn
    }()
    
    
    let pageController: UIPageViewController = {
        let pgController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return pgController
    }()
    
    private(set) lazy var featuresViewControllers: [UIViewController] = {
        return [NetflixFeaturesViewController(),
                NetflixFeaturesViewController(),
                NetflixFeaturesViewController(),
                NetflixFeaturesViewController()]
    }()
    
    fileprivate let viewModel = LandingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Setup UI
    private func setupUI(){
        navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .rgba(r: 0, g: 0, b: 0, a: 1)
        self.pageController.view.frame = self.view.frame
        self.pageController.dataSource = self
        self.view.addSubview(pageController.view)
        if let firstViewController = featuresViewControllers.first{
            self.pageController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        view.addSubview(loginButton)
        loginButton.addAnchor(left: view.leadingAnchor, 20, right: view.trailingAnchor, 20, top: nil, nil, bottom: view.bottomAnchor, 50,w: nil, h: 50)
        
    }
    
    @objc func onTapLogin(){
        let loginView = LoginViewController()
        self.navigationController?.pushViewController(loginView, animated: true)
        
//        let videosViewController = VideosViewController()
//        videosViewController.modalPresentationStyle = .overFullScreen
//        self.present(videosViewController, animated: true, completion: nil)
    }
    
}


//MARK: - Page View COntroller
extension LandingViewController : UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = featuresViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard featuresViewControllers.count > previousIndex else {
            return nil
        }
        
        if let appFeaturesViewController = featuresViewControllers[previousIndex] as? NetflixFeaturesViewController{
            appFeaturesViewController.dataModel = self.viewModel.appFeatureForIndex(index: previousIndex)
            return appFeaturesViewController
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = featuresViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = featuresViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        if let appFeaturesViewController = featuresViewControllers[nextIndex] as? NetflixFeaturesViewController{
            appFeaturesViewController.dataModel = self.viewModel.appFeatureForIndex(index: nextIndex)
            return appFeaturesViewController
        }
        
        return nil
    }
    
    
    
}


