//
//  ProfileViewModel.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/15/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class ProfileViewModel: NSObject {
    
    private var profiles: [Profile] = []
    
    private var selectedProfile: Profile?
    
    override init() {
        self.profiles = [Profile(choice: ["Adventure", "Thriller", "Comedy"], _id: "1e265dtd64567433466", title: "Jayanta", category: "Adult")]
    }
    
}

//MARK: - Expose Public data
extension ProfileViewModel {
    
    func profileCount() -> Int{
        return self.profiles.count + 1
    }
    
    func profileForIndex(index: Int) -> Profile?{
        return index < profiles.count ? self.profiles[index] : nil
    }
    
    func selectProfileToWatch(profile: Profile){
        self.selectedProfile = profile
    }
}
