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
        
        lifeModel.dimX = 500
        lifeModel.dimY = 500
        lifeModel.cellQuantity = 400
        
        lifeModel.generateSet()
        
        for item in lifeModel.cellSet {
            let squareSprite = SKSpriteNode(color: UIColor.blueColor(), size: CGSizeMake(8, 8))
            squareSprite.anchorPoint = CGPointMake(0, 0)
            squareSprite.position = CGPoint(x: item.x + 1, y: item.y + 1)
            //squareSprite.name = item.0
            //println(item.0)
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
        for child in children {
            child.removeFromParent()
        }
        
        lifeModel.iterateSet()
        
        for item in lifeModel.cellSet {
            let squareSprite = SKSpriteNode(color: UIColor.blueColor(), size: CGSizeMake(8, 8))
            squareSprite.anchorPoint = CGPointMake(0, 0)
            squareSprite.position = CGPoint(x: item.x + 1, y: item.y + 1)
            //squareSprite.name = item.0
            //println(item.0)
            addChild(squareSprite)
        }
        
    }
}
