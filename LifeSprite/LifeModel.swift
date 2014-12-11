//
//  LifeModel.swift
//  LifeSprite
//
//  Created by Dmitri Orlov on 12/9/14.
//  Copyright (c) 2014 Bullet. All rights reserved.
//

import UIKit

class LifeModel: NSObject {
    
    typealias CoordSet = [String: (CGFloat,CGFloat)]
    
    var dimX: Int
    var dimY: Int
    var cellQuantity: Int
    var cellSet: CoordSet
    
    override init () {
        dimX = 0
        dimY = 0
        cellQuantity = 0
        cellSet = CoordSet()
        super.init()
    }
    
    class var sharedInstance: LifeModel {
        struct Singleton {
            static let instance = LifeModel()
        }
        
        return Singleton.instance
    }

    
    func generateSet() {
        
        var dict: CoordSet = CoordSet()
        
        for i in 0...cellQuantity {
            let argX = UInt32(Float(dimX)/10)
            let argY = UInt32(Float(dimY)/10)
            let x = arc4random_uniform(argX) * 10
            let y = arc4random_uniform(argY) * 10
            let key = "\(x):\(y)"
            
            if (dict.indexForKey(key) == nil) {
                dict[key] = (CGFloat(x),CGFloat(y))
            }
            
        }
        
        cellSet = dict
    }
    
    func iterateSet() {
        
        var newSet = CoordSet()
        for item in cellSet {
            newSet[item.0] = (item.1.0, item.1.1 + 1)
        }
        
        cellSet = newSet
        
    }
    
}
