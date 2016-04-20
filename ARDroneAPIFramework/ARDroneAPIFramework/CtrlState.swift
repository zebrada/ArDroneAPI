//
//  CtrlState.swift
//  ARDroneAPI
//
//  Created by Fabien on 17/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

enum CtrlState: Int32{
    case DEFAULT = 0, INIT, LANDED, FLYING, HOVERING, TEST, TRANS_TAKEOFF, TRANS_GOTOFIX, TRANS_LANDING
}