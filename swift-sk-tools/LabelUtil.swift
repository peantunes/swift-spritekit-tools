//
//  LabelUtil.swift
//  Puzzle
//
//  Created by Pedro Antunes on 06/01/2015.
//  Copyright (c) 2015 Antunes. All rights reserved.
//

import SpriteKit

struct LabelUtil{
    
    static func labelCreatorLeft(position:CGPoint, size:CGFloat) -> SKLabelNode{
        let label = self.labelCreator(position, size:size)
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        return label
    }
    
    static func labelCreator(position:CGPoint, size:CGFloat) -> SKLabelNode{
        let label = self.labelCreator(position)
        label.fontSize = CGFloat(size)
        return label
    }
    
    static func labelCreator(position:CGPoint) -> SKLabelNode{
        let label = SKLabelNode(fontNamed: Constants.Fonts.Base)
        label.position = position;
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
        label.fontColor = UIColor.whiteColor()
        label.zPosition = 1;
        return label
    }
    
    static func stringMinutes(timer:Int) -> String{
        let ti = Int(timer)
        let seconds = ti%60
        let minutes = (ti/60)%60
        let stringMinutes = (minutes<=9 ? "0" : "") + String(minutes)
        let stringSeconds = (seconds<=9 ? "0" : "") + String(seconds)
        return "\(stringMinutes):\(stringSeconds)"
    }
}

