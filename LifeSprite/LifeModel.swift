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
    
    func generateSet() -> [String: (CGFloat,CGFloat)] {
        
        var dict = [String: (CGFloat,CGFloat)]()
        
        for i in 0...100 {
            let arg = UInt32(60)
            let x = arc4random_uniform(arg) * 10
            let y = arc4random_uniform(arg) * 10
            let key = "\(x):\(y)"
            
            if (dict.indexForKey(key) == nil) {
                dict[key] = (CGFloat(x),CGFloat(y))
            }
            
        }
        
        return dict
    }
    
}
