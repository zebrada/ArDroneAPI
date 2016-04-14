//
//  StartViewController.swift
//  ARDroneAPI
//
//  Created by Damien Serin on 27/03/2016.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class StartViewController: UIViewController {
    
    var inSocket : InSocket!
    var outSocket : OutSocket!
    var commandQueue: CommandQueue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commandQueue = CommandQueue()
        inSocket = InSocket()
        outSocket = OutSocket(cmdQueue: commandQueue)
        outSocket.send("This is a message!")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func fafaf(sender: AnyObject) {
        inSocket.send("message")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func clickDecollage(sender: UIButton) {
        
        commandQueue.add(TakeOffCommand())
    }
    
    @IBAction func clickAtterrissage(sender: UIButton) {
        
        commandQueue.add(LandCommand())
    }
    
    @IBAction func gaucheButtonDown(sender: AnyObject) {
        
       for var i in 0 ... 20{
            commandQueue.add(PCMDCommand(hover: false, combined_yaw_enabled: false, left_right_tilt: 0, front_back_tilt: 0, vertical_speed: 0, angular_speed: -0.3))
            usleep(30000)
        }
    }
    
    @IBAction func droiteButtonDown(sender: AnyObject) {
        for var i in 0 ... 20{
            commandQueue.add(PCMDCommand(hover: false, combined_yaw_enabled: false, left_right_tilt: 0, front_back_tilt: 0, vertical_speed: 0, angular_speed: 0.3))
            usleep(30000)
        }
    }
}
