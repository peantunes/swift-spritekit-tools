//
//  ScreenNode.swift
//  Puzzle
//
//  Created by Pedro Antunes on 06/01/2015.
//  Copyright (c) 2015 Antunes. All rights reserved.
//

import SpriteKit

class ScreenNode:SKSpriteNode{
    weak var mainScene:SKScene?
    var clickable=true
    
    class func screenInto(scene:SKScene, clickOutside:Bool) -> ScreenNode{
        return self.screenInto(scene, clickOutside: clickOutside, alpha: 0.6)
    }
    
    class func screenInto(scene:SKScene, clickOutside:Bool, alpha:Double) -> ScreenNode{
        let color = UIColor(white: 0, alpha: CGFloat(alpha))
        let screen = ScreenNode(color: color, size: scene.size)
        
        screen.mainScene = scene
        screen.userInteractionEnabled = true
        
        screen.clickable=clickOutside
        
        
        screen.position = CGPointMake(CGRectGetMidX(scene.frame), CGRectGetMidY(scene.frame))
        
        screen.zPosition = CGFloat(Constants.Position.Popup)
        
        
        scene.addChild(screen)
        return screen
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if (self.clickable){
            let node:SKNode = self.children[0] as SKNode
            AnimationUtil.removeAnimatedImage(node, callback: { () -> Void in
                
            })
        }
        self.mainScene?.touchesBegan(touches, withEvent: event)
    }
}
