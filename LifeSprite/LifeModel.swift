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
    
    typealias CoordSet = [CGPoint]
    
    var dimX: CGFloat
    var dimY: CGFloat
    var cellQuantity: Int
    var cellSet: CoordSet
    
    override init () {
        dimX = 0
        dimY = 0
        cellQuantity = 0
        cellSet = []
        super.init()
    }
    
    class var sharedInstance: LifeModel {
        struct Singleton {
            static let instance = LifeModel()
        }
        
        return Singleton.instance
    }

    
    func generateSet() {
        
        //var dict: CoordSet = CoordSet()
        
        for i in 0...cellQuantity {
            let argX = UInt32(dimX/10)
            let argY = UInt32(dimY/10)
            let coord = CGPoint(x: CGFloat(arc4random_uniform(argX) * 10), y: CGFloat(arc4random_uniform(argY) * 10))
            
            if !contains(cellSet, coord) {
                cellSet.append(coord)
            }
            
        }
        
        //cellSet = dict
        
        //cellSet = generateGliderAt(200, y: 400)
    }
    
    func generateNeighborCoord(coordString: CGPoint) -> CoordSet {
        
        var neighborSet = CoordSet()
        
        var xCoord = coordString.x
        var yCoord = coordString.y
        
        for xDelta in -1...1 {
            for yDelta in -1...1 {
                if (xDelta == 0 && yDelta == 0) {
                    continue
                } else {
                    var newXCoord = (xCoord + CGFloat(xDelta * 10))
                    if newXCoord < 0 {newXCoord = dimX + newXCoord}
                    if newXCoord >= dimX {newXCoord = newXCoord - dimX}
                    var newYCoord = (yCoord + CGFloat(yDelta * 10))
                    if newYCoord < 0 { newYCoord = dimY + newYCoord}
                    if newYCoord >= dimY {newYCoord = newYCoord - dimY}
                    
                    
                    neighborSet.append(CGPoint(x: newXCoord, y: newYCoord))
                }
            }
        }
        
        return neighborSet
    }
    
    func generateGliderAt(coord: CGPoint) -> CoordSet {
        var gliderSet = CoordSet()
        
        gliderSet.append(coord)
        gliderSet.append(CGPoint(x: coord.x-10, y: coord.y))
        gliderSet.append(CGPoint(x: coord.x-20, y: coord.y))
        gliderSet.append(CGPoint(x: coord.x-20, y: coord.y+10))
        gliderSet.append(CGPoint(x: coord.x-10, y: coord.y+20))

        
        return gliderSet
    }
    
    func iterateSet() {
        
        var newSet = CoordSet()
        var candidateForBirth = [String: Int]()
        
        for item in cellSet {
            
            //println(item)
            
            let neighbors = generateNeighborCoord(item)
            var count = 0
            
            for neighbor in neighbors {
                if contains(cellSet, neighbor) {
                    count++
                } else {
                    let stringNeighbor = String(point: neighbor)
                    if candidateForBirth.indexForKey(stringNeighbor) != nil {
                        candidateForBirth[stringNeighbor] = candidateForBirth[stringNeighbor]! + 1
                    } else {
                        candidateForBirth[stringNeighbor] = 1
                    }
                }
            }
            
            if (count == 2 || count == 3) {
                newSet.append(item)
            }

        }
        
        //println(candidateForBirth)
        
        for candidate in candidateForBirth {
            if candidate.1 == 3 {
                newSet.append(CGPoint(string: candidate.0))
            }
        }
        
        //println(newSet.keys)
        
        cellSet = newSet
        
        
    }
    
}
