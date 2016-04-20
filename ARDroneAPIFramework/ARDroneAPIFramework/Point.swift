//
//  Point.swift
//  ARDroneAPI
//
//  Created by Fabien on 17/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

class Point: NSObject{
    
    var x: Int32
    var y: Int32
    
    init(x: Int32, y: Int32) {
        self.x = x
        self.y = y
        super.init();
    }
    
    func getX() -> Int32
    {
        return x
    }
    
    func getY() -> Int32
    {
        return y
    }
}