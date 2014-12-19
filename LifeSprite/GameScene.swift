//
//  GameScene.swift
//  LifeSprite
//
//  Created by Dmitri Orlov on 12/9/14.
//  Copyright (c) 2014 Bullet. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    //let lifeModel = LifeModel.sharedInstance
    //var coordArray: CoordSet!
    
    var dimX: UInt32 = 60
    var dimY: UInt32 = 60
    var cellQuantity: Int!
    var arrayCapacity = 3600//Int(dimX*dimY)
    var cellArray = Array<Int32>(count: 3600, repeatedValue: 0)
    
    override func didMoveToView(view: SKView) {
        
        backgroundColor = SKColor.lightGrayColor()
        
        cellQuantity = 400
        //cellSet = CoordSet()
        
        //cellArray = Array<Int32>(count: arrayCapacity, repeatedValue: 0)
        generateSet()
        for i in 0..<cellArray.count {
            
            let squareSprite = SKSpriteNode(color: UIColor.darkGrayColor(), size: CGSizeMake(8, 8))
            squareSprite.anchorPoint = CGPointMake(0, 0)
            let xPos = i % Int(dimX)
            let yPos = (i - xPos)/Int(dimX)
            squareSprite.position = CGPoint(x: CGFloat(xPos)*10 + 100, y: CGFloat(yPos)*10 + 200)
            
            if (cellArray[i] == 0) {
                squareSprite.hidden = true
            }
            
            addChild(squareSprite)
        }
    }
    
    func generateSet() {
        
        for i in 0...cellQuantity {
            
            let x = arc4random_uniform(dimX - 1)
            let y = arc4random_uniform(dimY - 1)
            
            cellArray[Int(x + y*dimX)] = 1
        }
    }
    
//    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//        lifeModel.iterateSet()
//        
//        var i = 0
//        
//        for node in self.children {
//            
//            if let sprite = node as? SKSpriteNode {
//                
//                if lifeModel.cellArray[i] == true {
//                    
//                    sprite.hidden = false
//                } else {
//                    sprite.hidden = true
//                }
//            }
//            i++
//        }
//    }
   
    override func update(currentTime: CFTimeInterval) {
        
        iterateSetInC(Int32(arrayCapacity), Int32(dimX), Int32(dimY), &cellArray)
        
        var i = 0
        
        for node in self.children {
            
            if let sprite = node as? SKSpriteNode {
                
                if cellArray[i] == 1 {
                    
                    sprite.hidden = false
                } else {
                    sprite.hidden = true
                }
            }
            i++
        }
        
    }
}
