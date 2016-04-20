//
//  PCMDCommand.swift
//  ARDroneAPI
//
//  Created by Fabien on 12/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

class PCMDCommand : ATCommand {
    
    init (hover: Bool, combined_yaw_enabled: Bool, left_right_tilt: Float32, front_back_tilt: Float32,
          vertical_speed: Float32, angular_speed: Float32) {
        var mode : Int32
        let values: [Any]
        
        if(hover){
            values = [Int32(0), Float32(0), Float32(0), Float32(0), Float32(0)]
        }
        else{
            mode = 1
            mode |= (combined_yaw_enabled) ? 1<<1 : 0
            values = [mode, left_right_tilt, front_back_tilt, vertical_speed, angular_speed]
        }
        
        super.init(type: "PCMD", args: values)
    }
}