//
//  OutSocket.swift
//  ARDroneAPI
//
//  Created by Damien Serin on 27/03/2016.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

enum State {
    case TAKEOFF
    case LAND
}

class OutSocket: NSObject, GCDAsyncUdpSocketDelegate {
    
    let IP = "192.168.1.1"
    let PORT:UInt16 = 5556
    var socket:GCDAsyncUdpSocket!
    var seqNumber:Int32 = 0
    var state:State = State.LAND
    var cmdQueue: CommandQueue
    var running: Bool
    
    init(cmdQueue: CommandQueue){
        
        self.cmdQueue = cmdQueue
        running = false
        super.init()
        //setupConnection()
        //run ()
    }
    
    func setupConnection(){
        //var error : NSError?
        socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        try! socket.bindToPort(PORT)
        try! socket.connectToHost(IP, onPort: PORT)
        try! socket.beginReceiving()
        //send("ping")
        running = true
        run()
    }
    
    func closeConnection(){
        
        socket.close()
    }
    
    func send(message:String){
        let data = message.dataUsingEncoding(NSUTF8StringEncoding)
        socket.sendData(data, withTimeout: 2, tag: 0)
    }
    
    
    func run () {
        
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) { () -> Void in
        
            while self.running {
            
                let AT = self.cmdQueue.get()
                self.seqNumber += 1
            
                if AT != nil {
                
                    if AT is TakeOffCommand {
                        self.state = State.TAKEOFF
                    }
                    else if AT is LandCommand {
                        self.state = State.LAND
                    }
                    self.send(AT!.getCommandString(self.seqNumber))
                    print(AT!.getCommandString(self.seqNumber))
                }
                else {
                    // TODO : Envoit en cas de file vide pour ne pas perdre la connection
                    //let uselessAT = (self.state == State.LAND) ? LandCommand() : TakeOffCommand()
                    let uselessAT = PCMDCommand(hover: true, combined_yaw_enabled: false, left_right_tilt: 0, front_back_tilt: 0, vertical_speed: 0, angular_speed: 0)
                
                    self.send (uselessAT.getCommandString(self.seqNumber))
                }
                //On envoit un message toute les 30ms
                usleep(30000)
            }
        }
    }
    
    func stop () {
        
        running = false
        socket.close()
        socket = nil
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didConnectToAddress address: NSData!) {
        print("[5556]didConnectToAddress");
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didNotConnect error: NSError!) {
        print("[5556]didNotConnect \(error)")
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didSendDataWithTag tag: Int) {
        //print("[5556]didSendDataWithTag")
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didNotSendDataWithTag tag: Int, dueToError error: NSError!) {
        print("[5556]didNotSendDataWithTag")
    }
}