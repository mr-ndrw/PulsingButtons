//
//  UIColorExtensions.swift
//  Pulsing Buttons
//
//  Created by Andrew Torski on 26/06/15.
//  Copyright (c) 2015 Andrew Torski. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    /**
        Creates and retuns a new UIColor instance using specified opacity and RBG components expressed as Integral numbers.
    
        :param: red
            The red component of the color object, specified as a value from 0 to 255.
        :param: green
            The green component of the color object, specified as a value from 0.0 to 1.0.
        :param: blue
            The blue component of the color object, specified as a value from 0.0 to 1.0.
        :param: alpha
            The red component of the color object, specified as a value from 0.0 to 1.0.
    */
    convenience init(redInt: Int, greenInt: Int, blueInt: Int, alpha: Double){
        let redFloat    : CGFloat = CGFloat(Float(redInt) / 255.0)
        let greenFloat  : CGFloat = CGFloat(Float(greenInt) / 255.0)
        let blueFloat   : CGFloat = CGFloat(Float(blueInt) / 255.0)
        
        self.init(red: redFloat, green: greenFloat, blue: blueFloat, alpha: CGFloat(alpha))
    }
    
}
