//
//  InSocket.swift
//  ARDroneAPIFramework
//
//  Created by Mickael Goualard on 30/03/16.
//  Copyright © 2016 Mickael Goualard. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class InSocket: NSObject, GCDAsyncUdpSocketDelegate {
    let IP = "255.255.255.255"
    let PORT:UInt16 = 5554
    var socket:GCDAsyncUdpSocket!
    
    override init(){
        super.init()
        setupConnection()
    }
    
    func setupConnection() {
        //var error : NSError?
        socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        try! socket.bindToPort(PORT)
        try! socket.enableBroadcast(true)
        //try! socket.joinMulticastGroup(IP)
        try! socket.beginReceiving()
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didReceiveData data: NSData!, fromAddress address: NSData!,      withFilterContext filterContext: AnyObject!) {
        print("incoming message: \(data)");
    }
}
