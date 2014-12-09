//
//  GameScene.swift
//  LifeSprite
//
//  Created by Dmitri Orlov on 12/9/14.
//  Copyright (c) 2014 Bullet. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var squareSprite: SKSpriteNode!
    let lifeModel = LifeModel.sharedInstance
    
    override func didMoveToView(view: SKView) {
        
        backgroundColor = SKColor.lightGrayColor()
        squareSprite = SKSpriteNode(color: UIColor.blueColor(), size: CGSizeMake(10, 10))
        squareSprite.position = CGPointMake(300, 300)
        addChild(squareSprite)
        
        let aaa = LifeModel.sharedInstance.generateSet()
        
        println(aaa)

    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
