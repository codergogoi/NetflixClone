//
//  MoreViewModel.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/20/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

struct MoreOption {
    var icon : UIImage?
    var title: String
}

class MoreViewModel: NSObject {
    
    private var options = [MoreOption]()
    
    override init() {
        
        options = [MoreOption(icon: #imageLiteral(resourceName: "check"), title: "My List"), MoreOption(icon: #imageLiteral(resourceName: "settings"), title: "App Settings"), MoreOption(icon: #imageLiteral(resourceName: "account"), title: "Account"), MoreOption(icon: #imageLiteral(resourceName: "help"), title: "Help"), MoreOption(icon: nil, title: "Sign Out")]
    }
    
    
}

//MARK: - Expose Public data
extension MoreViewModel {
    
    func optionForIndex(index: Int) -> MoreOption?{
        return options[(index - 1)] // skip first index
    }
    
    func numbersOfItemsForSection()-> Int{
        return options.count + 1 // add Profile options
    }
    
}
