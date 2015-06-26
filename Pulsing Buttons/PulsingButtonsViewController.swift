//
//  PulsingButtonsViewController.swift
//  Pulsing Buttons
//
//  Created by Andrew Torski on 24/06/15.
//  Copyright (c) 2015 Andrew Torski. All rights reserved.
//

import UIKit

class PulsingButtonsViewController: UIViewController {

    var pulsingButtons2DArray : [[PulsingButtonView]] = []
    
    /// Number of buttons in a row.
    var numberOfButtonsInRow     : Int = 9
    
    /// Number of buttons in a column.
    var numberOfButtonsInColumn  : Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var pointsMatrix : [CGPoint] = getPointArray(   numberOfRows: numberOfButtonsInRow,
                                                     numberOfColumns: numberOfButtonsInColumn,
                                                        screenMargin: CGFloat(40.0))
        
        for point in pointsMatrix {
                var frame = CGRect(center: point, size: CGSize(width: 40.0, height: 40.0))
                var currentColor = UIColor(redInt: 255, greenInt: 209, blueInt: 220, alpha: 1.0)
                var pulsingButton : PulsingButtonView = PulsingButtonView(frame: frame, currentColor: currentColor)
                self.view.addSubview(pulsingButton)
        }
        
        // Do any additional setup after loading the view.
    }

    
    func getPointArray(#numberOfRows: Int, numberOfColumns: Int, screenMargin: CGFloat) -> [CGPoint]{
        //  2.  find extremeCornerPoint1 by taking width and height and adding screenMargin to them
        var extremePointUpperLeftCorner : CGPoint = CGPoint(x: screenMargin, y: screenMargin)
        
        //  3.  get deMarginalizedHeight by subtracting 2*screenMargin
        //      get deMarginalizedWidth by subtracting
        let screenHeight : CGFloat = self.view.bounds.height
        let screenWidth : CGFloat = self.view.bounds.width
        let demarginalizedHeight    : CGFloat = screenHeight - (2 * screenMargin)
        let demarginalizedWidth     : CGFloat = screenWidth  - (2 * screenMargin)
        
        //  4.  get pointXDifference by dividing demarginalizedHeight by numberOfRows - 1
        //      get pointYDifference by diding demarginalizedWidth by numberOfColumns - 1
        /*
                We're subtracting
        */
        let pointXDifference : CGFloat = demarginalizedWidth / CGFloat(numberOfColumns - 1)
        let pointYDifference : CGFloat = demarginalizedHeight / CGFloat(numberOfRows - 1)
        
        //  5.  create an array of points
        var pointArray : [CGPoint] = []
        
        //  6.  populate the array
        var currentX : CGFloat = extremePointUpperLeftCorner.x
        var currentY : CGFloat = extremePointUpperLeftCorner.y
        
        for rowNumber in 0..<numberOfRows {
            for columnNumber in 0..<numberOfColumns {
                var newPoint : CGPoint = CGPoint(x: currentX, y: currentY)
                pointArray.append(newPoint)
                currentX += pointXDifference
            }
            //  default currentX, since we're changing rows and going back to left edge
            currentX = extremePointUpperLeftCorner.x
            currentY += pointYDifference
        }
        
        return pointArray
    }
    
    func UIColorFromRGB(rgb: Int, alpha: Float) -> UIColor {
        let red = CGFloat(Float(((rgb>>16) & 0xFF)) / 255.0)
        let green = CGFloat(Float(((rgb>>8) & 0xFF)) / 255.0)
        let blue = CGFloat(Float(((rgb>>0) & 0xFF)) / 255.0)
        let alpha = CGFloat(alpha)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
