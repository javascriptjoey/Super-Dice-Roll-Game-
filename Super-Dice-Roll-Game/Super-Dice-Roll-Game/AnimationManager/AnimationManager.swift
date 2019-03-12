//
//  AnimationManager.swift
//  Super-Dice-Roll-Game
//
//  Created by Joey Essak on 3/12/19.
//  Copyright © 2019 Joey Essak. All rights reserved.
//

import UIKit
class AnimationManager{
    
    class var screenBounds: CGRect{
        return  UIScreen.main.bounds
    }
    
    class var screenTopAnchor: CGPoint {
        return CGPoint(x: screenBounds.minX, y: screenBounds.minY)
    }
    
    class var screenLeadingAnchor: CGPoint{
        return CGPoint(x: screenBounds.minX, y: screenBounds.minY)
    }
}
