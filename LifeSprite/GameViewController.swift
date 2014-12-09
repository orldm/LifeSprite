//
//  GameViewController.swift
//  LifeSprite
//
//  Created by Dmitri Orlov on 12/9/14.
//  Copyright (c) 2014 Bullet. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    @IBOutlet weak var sceneView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.frame.size)
        // Configure the view.
        //let sceneView = self.view as SKView
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        sceneView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        sceneView.presentScene(scene)
        
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

//    override func supportedInterfaceOrientations() -> Int {
//        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
//            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
//        } else {
//            return Int(UIInterfaceOrientationMask.All.rawValue)
//        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Release any cached data, images, etc that aren't in use.
//    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
