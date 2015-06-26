//
//  PulsingButtonView.swift
//  Pulsing Buttons
//
//  Created by Andrew Torski on 23/06/15.
//  Copyright (c) 2015 Andrew Torski. All rights reserved.
//

import UIKit

@IBDesignable
class PulsingButtonView : UIView {

    @IBInspectable var currentColor : UIColor = UIColor.redColor()
    @IBInspectable var pulseDiff : CGFloat = CGFloat(100.0)
    
    
    convenience init(frame: CGRect, currentColor: UIColor){
        self.init(frame: frame)
        self.currentColor = currentColor
        self.backgroundColor = UIColor.clearColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        opaque = false
        backgroundColor = UIColor.clearColor()
        var path = UIBezierPath(ovalInRect: rect)
        currentColor.setFill()
        path.fill()
    }
    
    @IBAction func tapAndHold(gesture: UITapGestureRecognizer?){
        self.bounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width * 1.5, height: bounds.size.height * 1.5))
        setNeedsDisplay()
    }
    
    
    @IBAction func tapped(sender: UITapGestureRecognizer?)
    {
        println("tapped")
        //Your animation code.
    }
    
    @IBAction func longPressed(sender: UILongPressGestureRecognizer)
    {
        if sender.state == UIGestureRecognizerState.Began {
            println("began")
            UIView.animateWithDuration(1.5,
                animations: {
                    var frame : CGRect = self.frame
                    frame.size.height += self.pulseDiff
                    frame.size.width += self.pulseDiff
                    frame.origin = CGPoint(x: frame.origin.x - (self.pulseDiff/2), y: frame.origin.self.y - (self.pulseDiff/2))
                    self.frame = frame
            })
        } else if sender.state == UIGestureRecognizerState.Ended {
            println("Ended")
            UIView.animateWithDuration(0.5,
                animations: {
                    var frame : CGRect = self.frame
                    frame.size.height -= self.pulseDiff
                    frame.size.width -= self.pulseDiff
                    frame.origin = CGPoint(x: frame.origin.x + (self.pulseDiff/2), y: frame.origin.self.self.self.y + (self.pulseDiff/2))
                    self.frame = frame
            })
        }
    }


}
