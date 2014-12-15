//
//  GameScene.swift
//  LifeSprite
//
//  Created by Dmitri Orlov on 12/9/14.
//  Copyright (c) 2014 Bullet. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    typealias CoordSet = [String: (CGFloat,CGFloat)]

    let lifeModel = LifeModel.sharedInstance
    var coordArray: CoordSet!
    
    override func didMoveToView(view: SKView) {
        
        backgroundColor = SKColor.lightGrayColor()

        
        lifeModel.generateSet()
        
        for i in 0..<lifeModel.cellArray.count {
            
            let squareSprite = SKSpriteNode(color: UIColor.blueColor(), size: CGSizeMake(8, 8))
            squareSprite.anchorPoint = CGPointMake(0, 0)
            let xPos = i % Int(lifeModel.dimX)
            let yPos = (i - xPos)/Int(lifeModel.dimY)
            squareSprite.position = CGPoint(x: CGFloat(xPos)*10, y: CGFloat(yPos)*10)
            
            if (lifeModel.cellArray[i] == false) {
                squareSprite.hidden = true
            }
            
            addChild(squareSprite)
        }
    }
    
//    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//        for child in children {
//            child.removeFromParent()
//        }
//        
//        lifeModel.iterateSet()
//        
//        for item in lifeModel.cellSet {
//            let squareSprite = SKSpriteNode(color: UIColor.blueColor(), size: CGSizeMake(10, 10))
//            squareSprite.anchorPoint = CGPointMake(0, 0)
//            squareSprite.position = CGPointMake(item.1.0, item.1.1)
//            squareSprite.name = item.0
//            //println(item.0)
//            addChild(squareSprite)
//        }
//    }
   
    override func update(currentTime: CFTimeInterval) {
        lifeModel.iterateSet()
        
        var i = 0
        
        for node in self.children {
            
            if let sprite = node as? SKSpriteNode {
                
                if lifeModel.cellArray[i] == true {
                    
                    sprite.hidden = false
                } else {
                    sprite.hidden = true
                }
            }
            i++
        }
        
    }
}
