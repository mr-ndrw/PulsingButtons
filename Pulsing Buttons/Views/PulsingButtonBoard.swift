//
//  PulsingButtonBoard.swift
//  Pulsing Buttons
//
//  Created by Andrew Torski on 24/06/15.
//  Copyright (c) 2015 Andrew Torski. All rights reserved.
//

import UIKit

class PulsingButtonBoard: UIView {

    var numberOfButtonsInRow     : Int!
    var numberOfButtonsInColumn  : Int!
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely fafects performance during animation.
    override func drawRect(rect: CGRect) {
        var center : CGPoint = findCenterPoint()
        
        var pulsingButton : PulsingButtonView = PulsingButtonView()
        pulsingButton.center = center
        self.addSubview(pulsingButton)
    }
    
    private func findCenterPoint() -> CGPoint{
        var xMid : CGFloat = self.bounds.width / 2
        var yMid : CGFloat = self.bounds.height / 2
        
        return CGPoint(x: xMid, y: yMid)
    }

}
