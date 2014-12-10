//
//  GameScene.swift
//  LifeSprite
//
//  Created by Dmitri Orlov on 12/9/14.
//  Copyright (c) 2014 Bullet. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    let lifeModel = LifeModel.sharedInstance
    
    override func didMoveToView(view: SKView) {
        
        backgroundColor = SKColor.lightGrayColor()
        
        let coordArray = LifeModel.sharedInstance.generateSet()
        for (x, y) in coordArray.values {
            let squareSprite = SKSpriteNode(color: UIColor.blueColor(), size: CGSizeMake(10, 10))
            squareSprite.position = CGPointMake(x, y)
            addChild(squareSprite)
        }
        

    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
