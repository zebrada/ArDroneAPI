//
//  DataDecoder.swift
//  ARDroneAPI
//
//  Created by Fabien on 17/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

class DataDecoder: NSThread{
    
    //private var log: Logger = Logger.getLogger(self.getClass().getName())
    
    /*private var datareader: ARDroneDataReader
    private var pauseFlag: Bool
    
    override init() {
        super.init()
    }
    
    /*synchronized*/ override func start() throws{
        super.start();
        if (nil == datareader) {
            throw NSError("No reading thread is arrached");
        }
    }
    
    internal func pauseCheck(){
        if (pauseFlag) {
            /*synchronized(this)*/ {
                if (pauseFlag) {
                    try {
                        wait();
                    } catch (InterruptedException e) {
                        log.log(Level.SEVERE, "Pause is interrupted", e);
                    }
                }
            }
        }
    }
    
    internal func setDataReader(datareader: ARDroneDataReader) {
    if (self.executing) {
    throw new RuntimeException("Rading Thrad already started. You can't change stream on fly");
    }
    self.datareader = datareader;
    }
    
    func getDataReader() -> ARDroneDataReader {
        return datareader;
    }
    
    /*synchronized*/ func pauseDecoding() {
        pauseFlag = true;
    }
    
    /*synchronized*/ func resumeDecoding() {
        pauseFlag = false;
        notify();
    }*/
    
    //public abstract void finish();
    
}