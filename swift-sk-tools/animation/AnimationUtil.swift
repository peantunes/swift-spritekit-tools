//
//  AnimationUtil.swift
//  Puzzle
//
//  Created by Pedro Antunes on 06/01/2015.
//  Copyright (c) 2015 Antunes. All rights reserved.
//

import SpriteKit

struct AnimationUtil{
    enum AnimationType {
        case None,
        ShowBouncing,
        FromSide,
        Fade,
        FlipCentral,
        ZoomOut,
        ZoomXOut
    }
    
    enum AnimationDirection{
        case FromTop,
        FromBottom,
        FromLeft,
        FromRight
    }
    struct Options{
        var type:AnimationType
        var direction = AnimationDirection.FromTop
        var time:Double
        
    }

    static func generateAnimation(options:Options)->SKAction{
        var action:SKAction?
        switch (options.type){
        case AnimationType.ShowBouncing:
            action = SKAction.sequence([
                SKAction.scaleTo(1.2, duration: options.time*0.5),
                SKAction.scaleTo(0.9, duration: options.time*0.175),
                SKAction.scaleTo(1.1, duration: options.time*0.175),
                SKAction.scaleTo(1, duration: options.time*0.125)])
        case AnimationType.Fade:
            action = SKAction.fadeInWithDuration(options.time)
            action?.timingMode = SKActionTimingMode.EaseInEaseOut
        case AnimationType.FlipCentral:
            action = SKAction.scaleXTo(1, duration: options.time)
            action?.timingMode = SKActionTimingMode.EaseInEaseOut
        case AnimationType.ZoomOut, AnimationType.ZoomXOut:
            action = SKAction.scaleTo(1, duration: options.time)
            action?.timingMode = SKActionTimingMode.EaseInEaseOut
        case AnimationType.FromSide:
            action = SKAction.moveTo(CGPointMake(0,0), duration: options.time)
            action?.timingMode = SKActionTimingMode.EaseInEaseOut
        default:
            action = SKAction.scaleTo(1, duration: 0)
        }
        return action!
    }
    
    /**
    Run a pre generated action
    */
    static func showAnimated(sprite:SKNode, scene:SKScene, action:SKAction, clickOutside:Bool)->SKNode{
        let screen = ScreenNode.screenInto(scene, clickOutside: clickOutside)
        screen.addChild(sprite)
        sprite.runAction(action)
        return sprite
    }
    
    static func removeImage(node:SKNode, action:SKAction, callback:()->Void){
        unowned let weakNode = node
        node.runAction(action, completion:{
            weakNode.parent?.removeFromParent()
            weakNode.parent?.removeAllChildren()
            weakNode.removeFromParent()
            weakNode.removeAllChildren()
            weakNode.removeAllActions()
        })
        
        callback()
    }
    static func removeAnimatedImage(node:SKNode, callback:()->Void){
        let action = SKAction.sequence([SKAction.scaleTo(1.2, duration: 0.1),
            SKAction.scaleTo(0, duration: 0.1)])
        self.removeImage(node, action: action, callback: callback)
    }

}


