//
//  VisionTag.swift
//  ARDroneAPI
//
//  Created by Fabien on 17/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

class VisionTag: NSObject{
    
    init(type: VisionTagType, position: Point, dimensions: Dimension, distance: Int32)
    {
        self.type = type;
        self.position = position;
        self.dimensions = dimensions;
        self.distance = distance;
        super.init();
    }
    
    
    // Type of the detected tag #i ; see the CAD_TYPE enumeration.
    var type: VisionTagType
    
    /**
     * X and Y coordinates of detected 2D-tag #i inside the picture, with (0, 0)
     * being the top-left corner, and (1000, 1000) the right-bottom corner
     * regardless the picture resolu- tion or the source camera.
     */
    var position: Point
    
    /**
     * Width and height of the detection bounding-box (2D-tag #i), when
     * applicable.
     */
    var dimensions: Dimension
    
    /**
     * Distance from camera to detected 2D-tag #i in centimeters, when
     * applicable.
     */
    var distance: Int32
    
    func getType() -> VisionTagType
    {
        return type;
    }
    
    func getPosition() -> Point
    {
        return position;
    }
    
    func getDimensions() -> Dimension
    {
        return dimensions;
    }
    
    func getDistance() -> Int32
    {
        return distance;
    }
    
    
    func toString() -> String
    {
        var string: String = String()
        string += "VisionTag [type="
        string += "\(type)"
        string += ", position="
        string += "\(position)"
        string += ", dimensions="
        string += "\(dimensions)"
        string += ", distance="
        string += "\(distance)"
        string += "]"
        return string;
    }
}

/**
 * @brief Values for the detection type on drone cameras.
 */
enum VisionTagType: Int32{
    case CAD_TYPE_HORIZONTL = 0 /* Deprecated */
    case CAD_TYPE_VERTICAL = 1 /* Deprecated */
    case CAD_TYPE_VISION = 2 /* Detection of 2D horizontal tags on drone shells */
    case CAD_TYPE_NONE = 3 /* Detection disabled */
    case CAD_TYPE_COCARDE = 4 /* Detects a roundel under the drone */
    case CAD_TYPE_ORIENTED_COCARDE = 5 /*
     * Detects an oriented roundel under the
     * drone
     */
    case CAD_TYPE_STRIPE = 6 /* Detects a uniform stripe on the ground */
    case CAD_TYPE_H_COCARDE = 7 /* Detects a roundel in front of the drone */
    case CAD_TYPE_H_ORIENTED_COCARDE = 8 /*
     * Detects an oriented roundel in front
     * of the drone
     */
    case CAD_TYPE_STRIPE_V = 9
    case CAD_TYPE_MULTIPLE_DETECTION_MODE = 10 /*
     * The drone
     * uses
     * several
     * detections
     * at the
     * same time
     */
    case CAD_TYPE_NUM = 11 /* Number of possible values for CAD_TYPE */
}