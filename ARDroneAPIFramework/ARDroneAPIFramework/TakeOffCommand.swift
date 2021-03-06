//
//  TakeOffCommand.swift
//  ARDroneAPI
//
//  Created by Pierre on 10/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

class TakeOffCommand : ATCommand {
    
    init () {
        
        var arg:Int32 = 0
        arg |= (1<<9)
        arg |= (1<<18)
        arg |= (1<<20)
        arg |= (1<<22)
        arg |= (1<<24)
        arg |= (1<<28)
        let value: [Any] = [arg]
        super.init(type: "REF", args: value)
    }
}