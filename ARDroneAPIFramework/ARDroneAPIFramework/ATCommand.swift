//
//  ATCommand.swift
//  ARDroneAPI
//
//  Created by Fabien on 09/04/16.
//  Copyright © 2016 Fabien Henry. All rights reserved.
//

import Foundation


class ATCommand: NSObject{
    
    var id: String
    var param: [Any]
    
    init(type: String, args: [Any]){
        
        self.id   = type;
        self.param   = args;
        super.init()
    }
   
    func getCommandString (seqNum: Int32) -> String {
        
        return "AT*"+id+"="+String(seqNum)+getParametersString()+"\r"
    }
    
    func encodeParameter (p: Any) -> String? {
        
        if p is Int32 {
            return String(p)
        }
        if p is Float32 {
            let val :Float32
            var bytes :Int32
            
            val = p as! Float32
            bytes = unsafeBitCast(val, Int32.self)
            return String(bytes)
        }
        if p is String {
            
            return "\""+(p as! String)+"\""
        }
        
        //Erreur
        return nil
    }
    
    func getParametersString () -> String {
        
        var res = ""
        for object in param {
            
            let s = encodeParameter(object)
            res += ","+s!
        }
        return res
    }
    
}

