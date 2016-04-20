//
//  DroneInstructions.swift
//  ARDroneAPIFramework
//
//  Created by Mickael Goualard on 30/03/16.
//  Copyright © 2016 Mickael Goualard. All rights reserved.
//

import UIKit

public class ARDrone: NSObject {
    
    var inSocket: InSocket!
    var outSocket: OutSocket!
    
    public override init() {
        inSocket = InSocket()
        outSocket = OutSocket()
    }
    
    /* Not tested yet */
    public func sendTakeOff() {
        var sequenceNumber: Int = 1
        let takeOffValue: UInt32 = 290718208
        /* Repeated until navdata shows the drone took off */
        while sequenceNumber < 5 {
            let data: String = "AT*REF=\(sequenceNumber),\(takeOffValue)<CR>"
            outSocket.send(data)
            sequenceNumber += 1
        }
    }
    
    /* Not tested yet */
    public func sendLanding() {
        var sequenceNumber: Int = 1
        let landingValue: UInt32 = 290717696
        /* Repeated until navdata shows the drone landed */
        while sequenceNumber < 5 {
            let data: String = "AT*REF=\(sequenceNumber),\(landingValue)<CR>"
            outSocket.send(data)
            sequenceNumber += 1
        }
    }
    
    /* Not tested yet */
    public func sendEmergencyStop() {
        var sequenceNumber: Int = 1
        let emergencyValue: UInt32 = 290717952
        /* Repeated until navdata shows the drone landed */
        while sequenceNumber < 5 {
            let data: String = "AT*REF=\(sequenceNumber),\(emergencyValue)<CR>"
            outSocket.send(data)
            sequenceNumber += 1
        }
    }
}
