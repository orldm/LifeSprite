//
//  LifeModel.swift
//  LifeSprite
//
//  Created by Dmitri Orlov on 12/9/14.
//  Copyright (c) 2014 Bullet. All rights reserved.
//

import UIKit

extension String {
    init(point: CGPoint) {
        self = "\(Int(point.x)):\(Int(point.y))"
    }
}

extension CGPoint {
    init(string: String) {
        let components = string.componentsSeparatedByString(":")
        let xCoord = components[0].toInt()
        let yCoord = components[1].toInt()
        self = CGPoint(x: CGFloat(xCoord!), y: CGFloat(yCoord!))
    }
}

class LifeModel: NSObject {
    
    typealias CoordSet = [String: (CGFloat,CGFloat)]
    
    var dimX: UInt32
    var dimY: UInt32
    var cellQuantity: Int
    var cellSet: CoordSet
    var cellArray: Array<UInt32>
    
    override init () {
        dimX = 0
        dimY = 0
        cellQuantity = 0
        cellSet = CoordSet()
        let count = Int(dimX*dimY)
        cellArray = Array<UInt32>(count: count, repeatedValue: 0)
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
            let x = Int(arc4random_uniform(argX) * 10)
            let y = Int(arc4random_uniform(argY) * 10)
            
            cellArray[x + y*x] = 1
            
        }
        
        //cellSet = generateGliderAt(200, y: 400)
    }
    
//    func generateNeighborCoord(coordString: String) -> [String] {
//        
//        var neighborSet = Array<String>()
//        
//        var xCoord = coordString.componentsSeparatedByString(":")[0].toInt()
//        var yCoord = coordString.componentsSeparatedByString(":")[1].toInt()
//        
//        for xDelta in -1...1 {
//            for yDelta in -1...1 {
//                if (xDelta == 0 && yDelta == 0) {
//                    continue
//                } else {
//                    var newXCoord = (xCoord! + xDelta * 10)
//                    if newXCoord < 0 {newXCoord = dimX + newXCoord}
//                    if newXCoord >= dimX {newXCoord = newXCoord - dimX}
//                    var newYCoord = (yCoord! + yDelta * 10)
//                    if newYCoord < 0 { newYCoord = dimY + newYCoord}
//                    if newYCoord >= dimY {newYCoord = newYCoord - dimY}
//                    
//                    
//                    neighborSet.append("\(newXCoord):\(newYCoord)")
//                }
//            }
//        }
//        
//        return neighborSet
//    }
    
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
    
//    func iterateSetOld() {
//        
//        var newSet = CoordSet()
//        var candidateForBirth = Dictionary<String, Int>()
//        
//        //println(cellSet.count)
//
//        
//        for item in cellSet {
//            
//            //println(item)
//            
//            let neighbors = generateNeighborCoord(item.0)
//            var count = 0
//            
//            for neighbor in neighbors {
//                if cellSet.indexForKey(neighbor) != nil {
//                    count++
//                } else {
//                    if candidateForBirth.indexForKey(neighbor) != nil {
//                        candidateForBirth[neighbor] = candidateForBirth[neighbor]! + 1
//                    } else {
//                        candidateForBirth[neighbor] = 1
//                    }
//                }
//            }
//            
//            if (count == 2 || count == 3) {
//                newSet[item.0] = (item.1.0, item.1.1)
//            }
//
//        }
//        
//        //println(candidateForBirth)
//        
//        for candidate in candidateForBirth {
//            if candidate.1 == 3 {
//                var xCoord = candidate.0.componentsSeparatedByString(":")[0].toInt()
//                var yCoord = candidate.0.componentsSeparatedByString(":")[1].toInt()
//                newSet["\(xCoord!):\(yCoord!)"] = (CGFloat(xCoord!), CGFloat(yCoord!))
//            }
//        }
//        
//        //println(newSet.keys)
//        
//        cellSet = newSet
//        
//    }
    
    func generateNeighborCoordinates(coord: Int) -> Array<Int> {
        
        var coordArray = Array<Int>(count: 8, repeatedValue: 0)
        
        for xDelta in -1...1 {
            for yDelta in -1...1 {
                if (xDelta == 0 && yDelta == 0) {
                    continue
                } else {
                    
                    // TODO: implement correct array number calculation
                    
                }
            }
        }
        
        return coordArray
    
    }
    
    func iterateSet() {
        
        let count = Int(dimX*dimY)
        var newCellArray = Array<UInt32>(count: count, repeatedValue: 0)
        
        for i in 0..<count {
            if cellArray[i] == 1 {
                let neighbors = generateNeighborCoordinates(i)
            }
        }
        
    }
    
}
