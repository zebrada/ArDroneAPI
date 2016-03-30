//
//  OutSocket.swift
//  ARDroneAPIFramework
//
//  Created by Mickael Goualard on 30/03/16.
//  Copyright © 2016 Mickael Goualard. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class OutSocket: NSObject, GCDAsyncUdpSocketDelegate {
    
    let IP = "192.168.200.22"
    let PORT:UInt16 = 5556
    var socket:GCDAsyncUdpSocket!
    
    override init(){
        super.init()
        setupConnection()
    }
    
    func setupConnection(){
        socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        //try! socket.bindToPort(PORT)
        try! socket.connectToHost(IP, onPort: PORT)
        //try! socket.beginReceiving()
    }
    
    func send(message:String){
        let data = message.dataUsingEncoding(NSUTF8StringEncoding)
        socket.sendData(data, withTimeout: 2, tag: 0)
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didConnectToAddress address: NSData!) {
        print("didConnectToAddress");
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didNotConnect error: NSError!) {
        print("didNotConnect \(error)")
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didSendDataWithTag tag: Int) {
        print("didSendDataWithTag")
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didNotSendDataWithTag tag: Int, dueToError error: NSError!) {
        print("didNotSendDataWithTag")
    }
}
