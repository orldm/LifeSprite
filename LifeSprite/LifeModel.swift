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
    
    func generateNeighborCoord(coordString: String) -> Array<String> {
        
        var neighborSet = Array<String>()
        
        var xCoord = coordString.componentsSeparatedByString(":")[0].toInt()
        var yCoord = coordString.componentsSeparatedByString(":")[1].toInt()
        
        for xDelta in -1...1 {
            for yDelta in -1...1 {
                if (xDelta == 0 && yDelta == 0) {
                    continue
                } else {
                    let newXCoord = xCoord! + xDelta
                    let newYCoord = yCoord! + yDelta
                    neighborSet.append("\(newXCoord):\(newYCoord)")
                }
            }
        }
        
        return neighborSet
    }
    
    func iterateSet() {
        
        var newSet = CoordSet()
        var candidateForBirth = Dictionary<String, Int>()
        
        for item in cellSet {
            
            let neighbors = generateNeighborCoord(item.0)
            var count = 0
            
            for neighbor in neighbors {
                if cellSet.indexForKey(neighbor) != nil {
                    count++
                } else {
                    if candidateForBirth.indexForKey(neighbor) != nil {
                        candidateForBirth[neighbor] = candidateForBirth[neighbor]! + 1
                    } else {
                        candidateForBirth[neighbor] = 1
                    }
                }
            }
            
            if (count == 2 || count == 3) {
                newSet[item.0] = (item.1.0, item.1.1)
            }

        }
        
        //println(candidateForBirth)
        
        for candidate in candidateForBirth {
            if candidate.1 == 3 {
                var xCoord = candidate.0.componentsSeparatedByString(":")[0].toInt()
                var yCoord = candidate.0.componentsSeparatedByString(":")[1].toInt()
                newSet["\(xCoord):\(yCoord)"] = (CGFloat(xCoord!), CGFloat(yCoord!))
            }
        }
        
        //println(newSet.count)
        
        cellSet = newSet
        
    }
    
}
