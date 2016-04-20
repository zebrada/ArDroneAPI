//
//  TrimCommand.swift
//  ARDroneAPI
//
//  Created by Pierre on 20/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

class TrimCommand : ATCommand {
    
    init () {
        
        let values: [Any]
        values = []
        super.init(type: "FTRIM", args: values)
    }
}