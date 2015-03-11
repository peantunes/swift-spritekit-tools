//
//  Switcher.swift
//  FunMemory
//
//  Created by Pedro Antunes on 01/03/2015.
//  Copyright (c) 2015 Antunes. All rights reserved.
//

import SpriteKit

protocol SwitcherProtocol {
    func switched(state:Bool)
}

class Switcher: SKSpriteNode {
    var button:SKSpriteNode?
    var delegate:SwitcherProtocol?
    
    private var active=false
    
    private var moving:NSValue?
    
    private var ant:CGFloat = 0.0
    private var start:CGFloat = 0.0
    private var diff:CGFloat = 0.0
    
    init(state:Bool, delegate:SwitcherProtocol?){
        
        super.init()
        
        self.delegate = delegate
        
        texture = SKTexture(imageNamed: "switcher_background.png")
        size = texture!.size()
        
        button = SKSpriteNode(imageNamed: "switcher_button.png");
        
        addChild(button!)
        setActive(state)
        userInteractionEnabled = true

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    func setActive(state:Bool){
        active = state
        self.delegate!.switched(state)
        let action = SKAction.moveToX((state ? 1 : -1) * (button!.size.width/2-4), duration: 0.3)
        action.timingMode = SKActionTimingMode.EaseInEaseOut
        button!.runAction(action)
    }
    
    func isActive() -> Bool{
        return active
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch in touches {
            if (touch.tapCount > 1){
                return
            }
            if (moving == nil){
                let position = button!.position.x
                let key = NSValue(nonretainedObject: touch)
                moving = key
                let loc = touch.locationInNode(self)
                start = position - loc.x
                ant = loc.x
                diff = 0
            }
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            if (moving != nil && key.isEqualToValue(moving!)){
                let position = button!.position.x
                let loc = touch.locationInNode(self)
                diff = ant - loc.x
                
                if (position - diff < -1*(button!.size.width/2-4)){
                    button!.position = CGPointMake(-1*(button!.size.width/2-4), 0)
                }else if (position - diff > 1*(button!.size.width/2-4)){
                    button!.position = CGPointMake(1*(button!.size.width/2-4), 0)
                }else{
                    button!.position = CGPointMake(position-diff, 0)
                }
                ant = loc.x
                
            }
        }
    }
    
    func touchesEnd(touches: NSSet, withEvent event: UIEvent) {
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            if (moving != nil && key.isEqualToValue(moving!)){
                if (diff == 0){
                    //tap
                    setActive(!active)
                }else{
                    setActive(button!.position.x>0)
                }
                moving = nil
            }
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        touchesEnd(touches, withEvent: event)
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        touchesEnd(touches, withEvent: event)
    }
}


