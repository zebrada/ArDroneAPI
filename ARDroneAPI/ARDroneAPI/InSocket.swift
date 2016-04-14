//
//  InSocket.swift
//  ARDroneAPI
//
//  Created by Damien Serin on 27/03/2016.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class InSocket: NSObject, GCDAsyncUdpSocketDelegate {
    
    let IP = "192.168.1.1"
    let IP_MULTICAST = "239.255.255.255"
    let PORT:UInt16 = 5554
    var socket:GCDAsyncUdpSocket!
    
    override init(){
        super.init()
        setupConnection()
    }
    
    func setupConnection() {
        //var error : NSError?
        socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        print("Avant bind")
        try! socket.bindToPort(PORT)
        print("Avant connect")
        try! socket.connectToHost(IP, onPort: PORT)
        print("Avant enabled")
        try!  socket.enableBroadcast(true)
        /*print("Avant join")
        do {
         try socket.joinMulticastGroup(IP_MULTICAST)
        }catch let error {
            print("erreur \(error)")
        }*/
        print("Avant begin")
        try!  socket.beginReceiving()
        print("avant send ")
        send("ping")
        
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didReceiveData data: NSData!, fromAddress address: NSData!,      withFilterContext filterContext: AnyObject!) {
        print("incoming message: \(data)");
        var header:UInt32 = 0
        data.getBytes(&header, length: 4)
        if header == 0x55667788 {
            print("header deteted")
        }
    }
    
    func send(message:String){
        let data = message.dataUsingEncoding(NSUTF8StringEncoding)
        socket.sendData(data, withTimeout: 0.5, tag: 0)
        print("local : \(socket.localHost())\ndistant : \(socket.connectedHost())")
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didConnectToAddress address: NSData!) {
        print("[5554]didConnectToAddress");
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didNotConnect error: NSError!) {
        print("[5554]didNotConnect \(error)")
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didSendDataWithTag tag: Int) {
        print("[5554]didSendDataWithTag")
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didNotSendDataWithTag tag: Int, dueToError error: NSError!) {
        print("[5554]didNotSendDataWithTag")
    }
}