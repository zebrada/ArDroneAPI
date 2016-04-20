//
//  NavDataTag.swift
//  ARDroneAPI
//
//  Created by Fabien on 17/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

enum NavDataTag: UInt16{
    case NAVDATA_DEMO_TAG =             0
    case NAVDATA_TIME_TAG =             1
    case NAVDATA_RAW_MEASURES_TAG =     2
    case NAVDATA_PHYS_MEASURES_TAG =    3
    case NAVDATA_GYROS_OFFSETS_TAG =    4
    case NAVDATA_EULER_ANGLES_TAG =     5
    case NAVDATA_REFERENCES_TAG =       6
    case NAVDATA_TRIMS_TAG =            7
    case NAVDATA_RC_REFERENCES_TAG =    8
    case NAVDATA_PWM_TAG =              9
    case NAVDATA_ALTITUDE_TAG =         10
    case NAVDATA_VISION_RAW_TAG =       11
    case NAVDATA_VISION_OF_TAG =        12
    case NAVDATA_VISION_TAG =           13
    case NAVDATA_VISION_PERF_TAG =      14
    case NAVDATA_TRACKERS_SEND_TAG =    15
    case NAVDATA_VISION_DETECT_TAG =    16
    case NAVDATA_WATCHDOG_TAG =         17
    case NAVDATA_ADC_DATA_FRAME_TAG =   18
    case NAVDATA_VIDEO_STREAM_TAG =     19
    case NAVDATA_CKS_TAG =              0xFFFF
}