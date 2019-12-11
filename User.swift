//
//  User.swift
//  MVVMTutorial
//
//  Created by ByungHoon Ann on 2019/12/11.
//  Copyright © 2019 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit

struct User {
    let name: String
    let age: Int
    let backGroundColor: UIColor
    
    init(name: String, age: Int, backGroundColor: UIColor) {
        self.name = name
        self.age = age
        self.backGroundColor = backGroundColor
    }

}
