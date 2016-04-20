//
//  ARDroneNavDataDecoder.swift
//  ARDroneAPI
//
//  Created by Fabien on 17/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

class ARDroneNavDataDecoder: DataDecoder{
    
    /*var drone: ARDrone*/
    
    override init(/* drone: ARDrone*/) {
    /*self.drone = drone*/
    }
    
    func notifyDroneWithDecodedNavdata(navdata: NavData) {
        //drone.navDataReceived(navdata)
        print("On a recu des navdata!")
    }
    
}