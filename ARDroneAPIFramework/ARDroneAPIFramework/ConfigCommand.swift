//
//  ConfigCommand.swift
//  ARDroneAPI
//
//  Created by Pierre on 20/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

class ConfigCommand : ATCommand {
    
    init (name: String, value: String) {
        let values: [Any]
        
        values = [name, value]
        
        super.init(type: "CONFIG", args: values)
    }
}