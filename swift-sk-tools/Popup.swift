//
//  Popup.swift
//  Puzzle
//
//  Created by Pedro Antunes on 06/01/2015.
//  Copyright (c) 2015 Antunes. All rights reserved.
//

import SpriteKit

class Popup: SKSpriteNode {
    
    init(size:CGSize, imageName:String!){
        super.init()
        self.size = size
        self.color = UIColor.clearColor()
        
        let border = BorderUtil.boxWith(size, imageNamed: imageName)
        super.addChild(border)
        
    }
    
    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    override func addChild(node: SKNode) {
        node.zPosition += 1
        super.addChild(node)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}