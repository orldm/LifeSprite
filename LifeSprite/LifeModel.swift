//
//  LifeModel.swift
//  LifeSprite
//
//  Created by Dmitri Orlov on 12/9/14.
//  Copyright (c) 2014 Bullet. All rights reserved.
//

import UIKit

class LifeModel: NSObject {
    
    class var sharedInstance: LifeModel {
        struct Singleton {
            static let instance = LifeModel()
        }
        return Singleton.instance
    }
    
    func generateSet() -> Int {
        return Int(arc4random_uniform(100))
    }
    
}
