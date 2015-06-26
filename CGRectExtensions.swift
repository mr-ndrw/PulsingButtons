//
//  CGRectExtensions.swift
//  Pulsing Buttons
//
//  Created by Andrew Torski on 26/06/15.
//  Copyright (c) 2015 Andrew Torski. All rights reserved.
//

import Foundation
import UIKit

extension CGRect{
    /**
        Initializes a new instance of the CGRect class using the center point of the rectangle and it's size.
        
        :param: center  A point that specifies the center of the rectangle.
        :param: size    A size that specifies the height and width of the rectangle.
    */
    init(center: CGPoint, size: CGSize){
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: CGPoint(x: originX, y: originY), size: size)
    }
    
}