//
//  BorderUtil.swift
//  Puzzle
//
//  Created by Pedro Antunes on 05/01/2015.
//  Copyright (c) 2015 Antunes. All rights reserved.
//

import SpriteKit

class BorderUtil {
    class func boxWith(size:CGSize, imageNamed:NSString) -> SKSpriteNode{
        let border = SKSpriteNode(imageNamed: imageNamed)
        let borderWidth:Double = Double(border.size.width)
        let borderHeight:Double = Double(border.size.height)
        
        let spaceX = 2.0
        let spaceY = 2.0
        
        let limitX = ((borderWidth*0.5) - (spaceX/2.0))/borderWidth
        let limitY = ((borderHeight*0.5) - (spaceY/2.0))/borderHeight
        
        border.centerRect = CGRectMake(CGFloat(limitX), CGFloat(limitY), CGFloat(spaceX/borderWidth),CGFloat(spaceY/borderHeight))
        
        border.xScale = CGFloat(Double(size.width)/borderWidth)
        border.yScale = CGFloat(Double(size.height)/borderHeight)
        
        return border
    }
}

