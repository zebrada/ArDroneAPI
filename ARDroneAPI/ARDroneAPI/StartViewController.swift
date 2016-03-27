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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inSocket = InSocket()
        outSocket = OutSocket()
        outSocket.send("This is a message!")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
