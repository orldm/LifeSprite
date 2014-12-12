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
        
        //cellSet = generateGliderAt(200, y: 400)
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
                    var newXCoord = (xCoord! + xDelta * 10)
                    if newXCoord < 0 {newXCoord = dimX + newXCoord}
                    if newXCoord > dimX {newXCoord = newXCoord - dimX}
                    var newYCoord = (yCoord! + yDelta * 10)
                    if newYCoord < 0 { newYCoord = dimY + newYCoord}
                    if newYCoord > dimY {newYCoord = newYCoord - dimY}
                    
                    
                    neighborSet.append("\(newXCoord):\(newYCoord)")
                }
            }
        }
        
        return neighborSet
    }
    
    func generateGliderAt(x:Int, y:Int) -> CoordSet {
        var gliderSet = CoordSet()
        
        var key = "\(x):\(y)"
        gliderSet[key] = (CGFloat(x), CGFloat(y))
        
        key = "\(x-10):\(y)"
        gliderSet[key] = (CGFloat(x-10), CGFloat(y))
        
        key = "\(x-20):\(y)"
        gliderSet[key] = (CGFloat(x-20), CGFloat(y))
        
        key = "\(x-20):\(y+10)"
        gliderSet[key] = (CGFloat(x-20), CGFloat(y+10))
        
        key = "\(x-10):\(y+20)"
        gliderSet[key] = (CGFloat(x-10), CGFloat(y+20))
        
        return gliderSet
    }
    
    func iterateSet() {
        
        var newSet = CoordSet()
        var candidateForBirth = Dictionary<String, Int>()
        
        //println(cellSet.count)

        
        for item in cellSet {
            
            //println(item)
            
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
                newSet["\(xCoord!):\(yCoord!)"] = (CGFloat(xCoord!), CGFloat(yCoord!))
            }
        }
        
        //println(newSet.keys)
        
        cellSet = newSet
        
        
    }
    
}
