//
//  Button.swift
//  Puzzle
//
//  Created by Pedro Antunes on 03/01/2015.
//  Copyright (c) 2015 Antunes. All rights reserved.
//

import SpriteKit

protocol ButtonDelegate{
    func click(Button)
}

class Button: SKSpriteNode {
    var action:(()->Void)?
    var label: SKLabelNode?
    var enabled = true
    
    private var oldScale = CGFloat(1.0)
    
    init (text:String?, imageName:String){
        super.init()
        let texture = SKTexture(imageNamed: imageName)
        self.texture = texture
        self.size = texture.size()
        self.userInteractionEnabled = true
        
        if (text != nil){
            self.label = SKLabelNode(fontNamed: Constants.Fonts.Base)
            self.label?.text = text!
            self.label?.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
            self.label?.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
            self.label?.color = UIColor.whiteColor()
            self.label?.zPosition = 1
            
            self.addChild(self.label!)
        }
    }
    
    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setScale(scale: CGFloat) {
        self.oldScale = scale
        super.setScale(scale)
    }
    
    func clicked(value:Bool){
        super.setScale(value ? oldScale*0.95 : oldScale*1.0)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        //click start
        self.clicked(true)
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        //click end
        self.clicked(false)
        if (enabled){
            self.action!()
        }
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        //click canceled
        self.clicked(false)
    }
}
