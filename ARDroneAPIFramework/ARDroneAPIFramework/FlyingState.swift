//
//  FlyingState.swift
//  ARDroneAPI
//
//  Created by Fabien on 17/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

enum FlyingState{
    case FLYING, TAKING_OFF, LANDING, LANDED
    
    static func fromControlState(state: CtrlState) -> FlyingState
    {
        switch(state)
        {
        case .FLYING, .HOVERING, .TRANS_GOTOFIX:
            return FlyingState.FLYING;
            
        case .TRANS_TAKEOFF:
            return FlyingState.TAKING_OFF;
            
        case .TRANS_LANDING:
            return FlyingState.LANDING;
            
        default:
            return FlyingState.LANDED;
        }
    }
}