//
//  CommandQueue.swift
//  ARDroneAPI
//
//  Created by Pierre on 10/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

class CommandQueue : NSObject{
    
    // var list = [ATCommand]()
    var command : ATCommand!
    var maxSize = 128
   // var lock: NSLock
    
    override init() {
       //lock = NSLock()
        super.init()
    }
    
    func add (AT: ATCommand) {
        
        //lock.lock()
        //list.append(AT)
        //lock.unlock()
        
        self.command = AT
    }
    
    func get () -> ATCommand? {
//        
//        //lock.lock()
//        if list.isEmpty {
//            
//            return nil
//        }
//        let ret = list [0]
//        list.removeAtIndex(0)
       // lock.unlock()
        return self.command
    }
    
}	