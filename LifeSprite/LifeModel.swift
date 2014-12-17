//
//  LifeModel.swift
//  LifeSprite
//
//  Created by Dmitri Orlov on 12/9/14.
//  Copyright (c) 2014 Bullet. All rights reserved.
//

import UIKit

class LifeModel: NSObject {
    
    //typealias CoordSet = [String: (CGFloat,CGFloat)]
    
    var dimX: UInt32
    var dimY: UInt32
    var cellQuantity: Int
    //var cellSet: CoordSet
    var cellArray: Array<Int32>
    var arrayCapacity: Int!
    
    override init () {
        dimX = 60
        dimY = 60
        cellQuantity = 400
        //cellSet = CoordSet()
        arrayCapacity = Int(dimX*dimY)
        cellArray = Array<Int32>(count: arrayCapacity, repeatedValue: 0)
        super.init()
    }
    
    class var sharedInstance: LifeModel {
        struct Singleton {
            static let instance = LifeModel()
        }
        
        return Singleton.instance
    }

    
    func generateSet() {
        
        for i in 0...cellQuantity {
            
            let x = arc4random_uniform(dimX - 1)
            let y = arc4random_uniform(dimY - 1)
            
            cellArray[Int(x + y*dimX)] = 1
        }
    }
    
//    func generateGliderAt(x:Int, y:Int) -> CoordSet {
//        var gliderSet = CoordSet()
//        
//        var key = "\(x):\(y)"
//        gliderSet[key] = (CGFloat(x), CGFloat(y))
//        
//        key = "\(x-10):\(y)"
//        gliderSet[key] = (CGFloat(x-10), CGFloat(y))
//        
//        key = "\(x-20):\(y)"
//        gliderSet[key] = (CGFloat(x-20), CGFloat(y))
//        
//        key = "\(x-20):\(y+10)"
//        gliderSet[key] = (CGFloat(x-20), CGFloat(y+10))
//        
//        key = "\(x-10):\(y+20)"
//        gliderSet[key] = (CGFloat(x-10), CGFloat(y+20))
//        
//        return gliderSet
//    }
    
    
//    func generateNeighborCoordinates(coord: Int) -> Int {
//        
//        //var coordArray = Array<Int>()
//        var oldX = coord % Int(dimX)
//        var oldY = (coord - oldX) / Int(dimX)
//        
//        var neighborCount = 0
//        
//        for xDelta in -1...1 {
//            for yDelta in -1...1 {
//                if (xDelta == 0 && yDelta == 0) {
//                    continue
//                } else {
//                    
//                    var newX = oldX + xDelta
//                    var newY = oldY + yDelta
//                    
//                    if newX < 0 {newX = Int(dimX) + newX}
//                    if newX >= Int(dimX) {newX = newX - Int(dimX)}
//                    
//                    if newY < 0 {newY = Int(dimY) + newY}
//                    if newY >= Int(dimY) {newY = newY - Int(dimY)}
//                    
//                    
//                    var newCoord = newX + Int(dimX) * newY
//                    
//                    if cellArray[newCoord] == true { neighborCount++ }
//                }
//            }
//        }
//        return neighborCount
//    }
    
    func iterateSet() {
        
        var newCellArray = Array<Int32>(count: arrayCapacity, repeatedValue: 0)
        
        for i in 0..<arrayCapacity {
            
            let neighborCount = generateNeighborCoordinates(Int32(i), Int32(dimX), Int32(dimY), UnsafeMutablePointer(cellArray))
            
            if cellArray[i] == 1 {
                if neighborCount == 2 || neighborCount == 3 { newCellArray[i] = 1 }
            } else {
                if neighborCount == 3 { newCellArray[i] = 1 }
            }
        }
        cellArray = newCellArray
    }
}
