//
//  ARDrone.swift
//  ARDroneAPI
//
//  Created by Pierre on 20/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

public class ARDrone : NSObject{
    
    var inSocket: InSocket!
    var commandQueue: CommandQueue
    var outSocket: OutSocket!
    var navData: NavData!
    
    public override init () {
        
        inSocket = InSocket()
        commandQueue = CommandQueue()
        outSocket = OutSocket(cmdQueue: commandQueue)
    }
    
    public func connect () {
        
        inSocket.setupConnection()
        outSocket.setupConnection()
    }
    
    public func disconnect () {
        
        inSocket.stop()
        outSocket.stop()
    }
    
    public func takeoff () {
        commandQueue.add(TakeOffCommand())
    }
    
    public func land() {
        commandQueue.add(LandCommand())
    }
    
    /**
     * Move the drone
     *
     * @param left_right_tilt The left-right tilt (aka. "drone roll" or phi
     *            angle) argument is a percentage of the maximum inclination as
     *            configured here. A negative value makes the drone tilt to its
     *            left, thus flying leftward. A positive value makes the drone
     *            tilt to its right, thus flying rightward.
     * @param front_back_tilt The front-back tilt (aka. "drone pitch" or theta
     *            angle) argument is a percentage of the maximum inclination as
     *            configured here. A negative value makes the drone lower its
     *            nose, thus flying frontward. A positive value makes the drone
     *            raise its nose, thus flying backward. The drone translation
     *            speed in the horizontal plane depends on the environment and
     *            cannot be determined. With roll or pitch values set to 0, the
     *            drone will stay horizontal but continue sliding in the air
     *            because of its inertia. Only the air resistance will then make
     *            it stop.
     * @param vertical_speed The vertical speed (aka. "gaz") argument is a
     *            percentage of the maximum vertical speed as defined here. A
     *            positive value makes the drone rise in the air. A negative
     *            value makes it go down.
     * @param angular_speed The angular speed argument is a percentage of the
     *            maximum angular speed as defined here. A positive value makes
     *            the drone spin right; a negative value makes it spin left.
     */
    
    public func move (left_right_tilt: Float32, front_back_tilt: Float32, vertical_speed: Float32, angular_speed: Float32) {
        commandQueue.add(PCMDCommand(hover: false, combined_yaw_enabled: true, left_right_tilt: left_right_tilt,
                        front_back_tilt: front_back_tilt, vertical_speed: vertical_speed, angular_speed: angular_speed))
    }
    
    
    
}