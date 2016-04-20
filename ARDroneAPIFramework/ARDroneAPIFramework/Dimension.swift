//
//  Dimension.swift
//  ARDroneAPI
//
//  Created by Fabien on 17/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

class Dimension: NSObject{
    
    var width: Int32
    var height: Int32
    
    init(width: Int32, height: Int32) {
        self.width = width
        self.height = height
        super.init();
    }
    
    func getWidth() -> Int32
    {
        return width
    }
    
    func getHeight() -> Int32
    {
        return height
    }
}