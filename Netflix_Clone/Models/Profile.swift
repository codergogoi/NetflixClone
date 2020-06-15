//
//  Profile.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 6/15/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

/*
 "choice": [
 "adventure",
 "comedy",
 "action"
 ],
 "_id": "5eccd21ba352a810db3fdeac",
 "title": "Jay",
 "category": "Adult"*/

struct Profile: Codable {
    
    var choice: [String]
    var _id: String
    var title: String
    var category: String
    
}
