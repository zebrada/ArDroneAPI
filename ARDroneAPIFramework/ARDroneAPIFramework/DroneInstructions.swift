//
//  DroneInstructions.swift
//  ARDroneAPIFramework
//
//  Created by Mickael Goualard on 30/03/16.
//  Copyright © 2016 Mickael Goualard. All rights reserved.
//

import UIKit

class DroneInstructions: NSObject {
    
    var inSocket: InSocket!
    var outSocket: OutSocket!
    
    override init() {
        inSocket = InSocket()
        outSocket = OutSocket()
    }
    
    func sendTakeOff() {
        // TODO: send takeOff signal.
    }
}
