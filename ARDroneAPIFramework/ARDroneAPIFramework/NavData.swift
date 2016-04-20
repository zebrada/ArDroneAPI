//
//  Navdata.swift
//  ARDroneAPI
//
//  Created by Fabien on 17/04/16.
//  Copyright © 2016 Damien Serin. All rights reserved.
//

import Foundation

class NavData: NSObject{
    
    
    //private let log: Logger = Logger.getLogger("NavData") //???
    
    var mode: Mode!
    
    // state flags
    var flying: Bool = false
    var videoEnabled: Bool = false
    var visionEnabled: Bool = false
    var controlAlgorithm: ControlAlgorithm!
    var altitudeControlActive: Bool = false
    var userFeedbackOn: Bool = false // /TODO better name
    var controlReceived: Bool = false
    var trimReceived: Bool = false
    var trimRunning: Bool = false
    var trimSucceeded: Bool = false
    var navDataDemoOnly: Bool = false
    var navDataBootstrap: Bool = false
    var motorsDown: Bool = false
    var gyrometersDown: Bool = false
    var batteryTooLow: Bool = false
    var batteryTooHigh: Bool = false
    var timerElapsed: Bool = false
    var notEnoughPower: Bool = false
    var angelsOutOufRange: Bool = false
    var tooMuchWind: Bool = false
    var ultrasonicSensorDeaf: Bool = false
    var cutoutSystemDetected: Bool = false
    var PICVersionNumberOK: Bool = false
    var ATCodedThreadOn: Bool = false
    var navDataThreadOn: Bool = false
    var videoThreadOn: Bool = false
    var acquisitionThreadOn: Bool = false
    var controlWatchdogDelayed: Bool = false
    var ADCWatchdogDelayed: Bool = false
    var communicationProblemOccurred: Bool = false
    var emergency: Bool = false
    
    // Common nav data
    var sequence: Int32 = 0
    
    // Demo nav data
    var ctrl_state: CtrlState!
    var battery: Int32 = 0
    var altitude: Float32 = 0
    var pitch: Float32 = 0
    var roll: Float32 = 0
    var yaw: Float32 = 0
    var vx: Float32 = 0
    var vy: Float32 = 0
    var vz: Float32 = 0
    
    // Vision tags data
    var vision_tags: [VisionTag]! //???
    
    override init() {
    }
    
    func getAltitude() -> Float32
    {
        return altitude
    }
    
    
    func getBattery() -> Int32
    {
        return battery
    }
    
    
    func getControlAlgorithm() -> ControlAlgorithm
    {
        return controlAlgorithm
    }
    
    
    func getControlState() -> CtrlState
    {
        return ctrl_state
    }
    
    
    func getLongitude() -> Float32
    {
        return vy
    }
    
    
    func getMode() -> Mode
    {
        return mode
    }
    
    
    func getPitch() -> Float32
    {
        return pitch
    }
    
    
    func getRoll() -> Float32
    {
        return roll
    }
    
    
    func getSequence() -> Int32
    {
        return sequence
    }
    
    
    func getVx() -> Float32
    {
        return vx
    }
    
    
    func getVz() -> Float32
    {
        return vz
    }
    
    
    func getYaw() -> Float32
    {
        return yaw
    }
    
    
    func isAcquisitionThreadOn() -> Bool
    {
        return acquisitionThreadOn
    }
    
    
    func isADCWatchdogDelayed() -> Bool
    {
        return ADCWatchdogDelayed
    }
    
    
    func isAltitudeControlActive() -> Bool
    {
        return altitudeControlActive
    }
    
    
    func isAngelsOutOufRange() -> Bool
    {
        return angelsOutOufRange
    }
    
    
    func isATCodedThreadOn() -> Bool
    {
        return ATCodedThreadOn
    }
    
    
    func isBatteryTooHigh() -> Bool
    {
        return batteryTooHigh
    }
    
    
    func isBatteryTooLow() -> Bool
    {
        return batteryTooLow
    }
    
    
    func isCommunicationProblemOccurred() -> Bool
    {
        return communicationProblemOccurred
    }
    
    
    func isControlReceived() -> Bool
    {
        return controlReceived
    }
    
    
    func isControlWatchdogDelayed() -> Bool
    {
        return controlWatchdogDelayed
    }
    
    
    func isCutoutSystemDetected() -> Bool
    {
        return cutoutSystemDetected
    }
    
    
    func isEmergency() -> Bool
    {
        return emergency
    }
    
    
    func isFlying() -> Bool
    {
        return flying
    }
    
    
    func isGyrometersDown() -> Bool
    {
        return gyrometersDown
    }
    
    
    func isMotorsDown() -> Bool
    {
        return motorsDown
    }
    
    
    func isNavDataBootstrap() -> Bool
    {
        return navDataBootstrap
    }
    
    
    func isNavDataDemoOnly() -> Bool
    {
        return navDataDemoOnly
    }
    
    
    func isNavDataThreadOn() -> Bool
    {
        return navDataThreadOn
    }
    
    
    func isNotEnoughPower() -> Bool
    {
        return notEnoughPower
    }
    
    
    func isPICVersionNumberOK() -> Bool
    {
        return PICVersionNumberOK
    }
    
    
    func isTimerElapsed() -> Bool
    {
        return timerElapsed
    }
    
    
    func isTooMuchWind() -> Bool
    {
        return tooMuchWind
    }
    
    
    func isTrimReceived() -> Bool
    {
        return trimReceived
    }
    
    
    func isTrimRunning() -> Bool
    {
        return trimRunning
    }
    
    
    func isTrimSucceeded() -> Bool
    {
        return trimSucceeded
    }
    
    
    func isUltrasonicSensorDeaf() -> Bool
    {
        return ultrasonicSensorDeaf
    }
    
    
    func isUserFeedbackOn() -> Bool
    {
        return userFeedbackOn
    }
    
    
    func isVideoEnabled() -> Bool
    {
        return videoEnabled
    }
    
    
    func isVideoThreadOn() -> Bool
    {
        return videoThreadOn
    }
    
    
    func isVisionEnabled() -> Bool
    {
        return visionEnabled
    }
    
    
    func getFlyingState() -> FlyingState
    {
        return FlyingState.fromControlState(ctrl_state)
    }
    
    
    func getVisionTags() -> [VisionTag] //???
    {
        return vision_tags
    }
    
    func setVisionTags(vision_tags: [VisionTag]) //???
    {
        self.vision_tags = vision_tags
    }
    
    static func createFromData(buf: NSData, len: Int) throws -> NavData
    {
        //log.fine("Parsing navdata len=\(len)")
        print("Fine: Parsing navdata len=\(len)")
        
        /*if (ByteOrder.LITTLE_ENDIAN != buf.order()) {
         buf.order(ByteOrder.LITTLE_ENDIAN)
         }*/
        
        let data: NavData = NavData()
        data.mode = Mode.BOOTSTRAP // Assume we are in bootstrap
        
        var offset: Int = 0
        
        //tmp = [buf[0],buf[1],buf[2],buf[3]]
        //let header: Int32 = UnsafePointer<Int32>(tmp).memory
        var header: Int32 = 0
        buf.getBytes(&header, range: NSRange(location: offset,length: 4))
        
        if(header != 0x55667788){
            throw  NavDataFormatException.RuntimeError("Error parsing NavData")
        }
        offset += 4
        
        //tmp = [buf[4],buf[5],buf[6],buf[7]]
        //let state: Int32 = UnsafePointer<Int32>(tmp).memory
        var state: Int32 = 0
        buf.getBytes(&state, range: NSRange(location: offset,length: 4))
        parseState(data, state: state)
        offset += 4
        
        //tmp = [buf[8], buf[9], buf[10], buf[11]]
        //data.sequence = UnsafePointer<Int32>(tmp).memory
        buf.getBytes(&data.sequence, range: NSRange(location: offset,length: 4))
        offset += 4
        
        // Int32 vision_flag = buf.getInt(offset)
        //offset += 4
        
        offset = 16
        
        // Read options
        while(offset < len)
        {
            //tmp = [buf[offset + 0], buf[offset + 1]]
            //let option_tag: UInt16 = UnsafePointer<UInt16>(tmp).memory
            var option_tag: UInt16 = 0
            buf.getBytes(&option_tag, range: NSRange(location: offset, length: 2))
            offset += 2
            
            print("Fine: option_tag: \(option_tag)")
            
            //tmp = [buf[offset + 0], buf[offset + 1]]
            //let option_len: UInt16 = UnsafePointer<UInt16>(tmp).memory
            var option_len: UInt16 = 0
            buf.getBytes(&option_len, range: NSRange(location: offset, length: 2))
            offset += 2
            
            if(option_len == 0){
                throw NavDataFormatException.RuntimeError("Zero-len option with tag \(option_tag)")
            }
            // log.fine("At offset \((offset - 4)) found option \(option_tag) with len=\(option_len)")
            
            if(option_tag == NavDataTag.NAVDATA_DEMO_TAG.rawValue)
            {
                do{
                    try parseDemoNavData(data, buf: buf, offset: offset)
                } catch NavDataFormatException.RuntimeError(let e){
                    print (e)
                }
                data.mode = Mode.DEMO
            } else if(option_tag == NavDataTag.NAVDATA_CKS_TAG.rawValue)
            {
                // this is last tag. We do not unpack it yet, but we gracefully
                // exit if it has been encountered.
                
                break
            } else if(option_tag == NavDataTag.NAVDATA_VISION_DETECT_TAG.rawValue)
            {
                let vtags: [VisionTag]?
                do{
                    try vtags = parseVisionTags(data, buf: buf, offset: offset)
                    if(vtags != nil){
                        data.setVisionTags(vtags!)
                    }
                } catch NavDataFormatException.RuntimeError(let e){
                    print (e)
                }
            } else
            {
                //log.warning("Skipping unknown NavData option with tag=\(option_tag)")
            }
            
            
            offset = offset + Int(option_len) - 4
        }
        
        // TODO: calculate checksum
        print("Fine: Got Nav data. mode \(data.mode)")
        
        return data
    }
    
    private static func parseVisionTags(data: NavData, buf: NSData, offset: Int) throws -> [VisionTag]?
    {
        var offset: Int = offset
        //var tmp: [UInt8]
        
        //tmp = [buf[offset + 0], buf[offset + 1], buf[offset + 2], buf[offset + 3]]
        //let nb_detected: Int32 = UnsafePointer<Int32>(tmp).memory
        var nb_detected: Int32 = 0
        buf.getBytes(&nb_detected, range: NSRange(location: offset, length: 4))
        offset += 4
        
        if(nb_detected != 0){
            //log.fine("\(nb_detected) vision tags detected")
            print("Fine: \(nb_detected) vision tags detected")
        }
        
        if(nb_detected == 0){
            return nil
        }
        
        assert (nb_detected > 0)
        var res:[VisionTag] = [VisionTag]()
        var decalage: Int
        for i: Int  in 0 ... nb_detected - 1
        {
            //A
            decalage = offset
            //tmp = [buf[decalage + 0], buf[decalage + 1], buf[decalage + 2], buf[decalage + 3]]
            //let type: Int32 = UnsafePointer<Int32>(tmp).memory
            var type: Int32 = 0
            buf.getBytes(&type, range: NSRange(location: decalage, length: 4))
            
            //B
            decalage = offset + 1 * 16
            //tmp = [buf[decalage + 0], buf[decalage + 1], buf[decalage + 2], buf[decalage + 3]]
            //let xc: Int32 = UnsafePointer<Int32>(tmp).memory
            var xc: Int32 = 0
            buf.getBytes(&xc, range: NSRange(location: decalage, length: 4))
            
            //C
            decalage = offset + 2 * 16
            //tmp = [buf[decalage + 0], buf[decalage + 1], buf[decalage + 2], buf[decalage + 3]]
            //let yc: Int32 = UnsafePointer<Int32>(tmp).memory
            var yc: Int32 = 0
            buf.getBytes(&yc, range: NSRange(location: decalage, length: 4))
            
            //D
            decalage = offset + 3 * 16
            //tmp = [buf[decalage + 0], buf[decalage + 1], buf[decalage + 2], buf[decalage + 3]]
            //let width: Int32 = UnsafePointer<Int32>(tmp).memory
            var width: Int32 = 0
            buf.getBytes(&width, range: NSRange(location: decalage, length: 4))
            
            //E
            decalage = offset + 4 * 16
            //tmp = [buf[decalage + 0], buf[decalage + 1], buf[decalage + 2], buf[decalage + 3]]
            //let height: Int32 = UnsafePointer<Int32>(tmp).memory
            var height: Int32 = 0
            buf.getBytes(&height, range: NSRange(location: decalage, length: 4))
            
            //F
            decalage = offset + 5 * 16
            //tmp = [buf[decalage + 0], buf[decalage + 1], buf[decalage + 2], buf[decalage + 3]]
            //let dist: Int32 = UnsafePointer<Int32>(tmp).memory
            var dist: Int32 = 0
            buf.getBytes(&dist, range: NSRange(location: decalage, length: 4))
            
            let vt: VisionTag = VisionTag(type: (VisionTagType(rawValue: type))!, position: Point(x: xc, y: yc), dimensions: Dimension(width: width, height: height), distance: dist)
            //log.fine("Vision#\(i) \(vt.toString())")
            print("Fine: Vision#\(i) \(vt.toString())")
            res.append(vt)
            
            offset += 4
        }
        
        /*
         i=0            i=1        i=2      i=3
         [A][A][A][A] [][][][] [][][][] [][][][]
         [B][B][B][B] [][][][] [][][][] [][][][]
         [C][C][C][C] [][][][] [][][][] [][][][]
         [D][D][D][D] [][][][] [][][][] [][][][]
         [E][E][E][E] [][][][] [][][][] [][][][]
         [F][F][F][F] [][][][] [][][][] [][][][]*/
        
        return res
    }
    
    private static func parseDemoNavData(data: NavData, buf: NSData, offset:Int) throws
    {
        var offset:Int = offset
        //var tmp: [UInt8]
        
        //tmp = [buf[offset + 0], buf[offset + 1], buf[offset + 2], buf[offset + 3]]
        //data.ctrl_state = CtrlState(rawValue: UnsafePointer<Int32>(tmp).memory >> 16)!
        var tmp_state: Int32 = 0
        buf.getBytes(&tmp_state, range: NSRange(location: offset, length: 4))
        data.ctrl_state = CtrlState(rawValue: tmp_state)
        print("Fine: Ctrl State \(data.ctrl_state)")
        
        offset += 4
        //tmp = [buf[offset + 0], buf[offset + 1], buf[offset + 2], buf[offset + 3]]
        //data.battery = UnsafePointer<Int32>(tmp).memory
        buf.getBytes(&data.battery, range: NSRange(location: offset, length: 4))
        offset += 4
        //tmp = [buf[offset + 0], buf[offset + 1], buf[offset + 2], buf[offset + 3]]
        //data.pitch = UnsafePointer<Float32>(tmp).memory / 1000
        buf.getBytes(&data.pitch, range: NSRange(location: offset, length: 4))
        data.pitch = data.pitch / 1000
        offset += 4
        //tmp = [buf[offset + 0], buf[offset + 1], buf[offset + 2], buf[offset + 3]]
        //data.roll = UnsafePointer<Float32>(tmp).memory / 1000
        buf.getBytes(&data.roll, range: NSRange(location: offset, length: 4))
        data.roll = data.roll / 1000
        offset += 4
        //tmp = [buf[offset + 0], buf[offset + 1], buf[offset + 2], buf[offset + 3]]
        //data.yaw = UnsafePointer<Float32>(tmp).memory / 1000
        buf.getBytes(&data.yaw, range: NSRange(location: offset, length: 4))
        data.yaw = data.yaw / 1000
        offset += 4
        //tmp = [buf[offset + 0], buf[offset + 1], buf[offset + 2], buf[offset + 3]]
        //data.altitude = UnsafePointer<Float32>(tmp).memory / 1000
        buf.getBytes(&data.altitude, range: NSRange(location: offset, length: 4))
        data.altitude = data.altitude / 1000
        offset += 4
        //tmp = [buf[offset + 0], buf[offset + 1], buf[offset + 2], buf[offset + 3]]
        //data.vx = UnsafePointer<Float32>(tmp).memory
        buf.getBytes(&data.vx, range: NSRange(location: offset, length: 4))
        offset += 4
        //tmp = [buf[offset + 0], buf[offset + 1], buf[offset + 2], buf[offset + 3]]
        //data.vy = UnsafePointer<Float32>(tmp).memory
        buf.getBytes(&data.vy, range: NSRange(location: offset, length: 4))
        offset += 4
        //tmp = [buf[offset + 0], buf[offset + 1], buf[offset + 2], buf[offset + 3]]
        //data.vz = UnsafePointer<Float32>(tmp).memory
        buf.getBytes(&data.vz, range: NSRange(location: offset, length: 4))
        offset += 4
    }
    
    private static func parseState(data: NavData, state: Int32)
    {
        data.flying = (state & 1) != 0
        data.videoEnabled = (state & (1 << 1)) != 0
        data.visionEnabled = (state & (1 << 2)) != 0
        data.controlAlgorithm = (state & (1 << 3)) != 0 ? ControlAlgorithm.ANGULAR_SPEED_CONTROL
            : ControlAlgorithm.EULER_ANGELS_CONTROL
        data.altitudeControlActive = (state & (1 << 4)) != 0
        data.userFeedbackOn = (state & (1 << 5)) != 0
        data.controlReceived = (state & (1 << 6)) != 0
        data.trimReceived = (state & (1 << 7)) != 0
        data.trimRunning = (state & (1 << 8)) != 0
        data.trimSucceeded = (state & (1 << 9)) != 0
        data.navDataDemoOnly = (state & (1 << 10)) != 0
        data.navDataBootstrap = (state & (1 << 11)) != 0
        data.motorsDown = (state & (1 << 12)) != 0
        //ARDRONE_COM_LOST_MASK       = 1U << 13, /*!< Communication Lost : (1) com problem, (0) Com is ok */
        data.gyrometersDown = (state & (1 << 14)) != 0
        data.batteryTooLow = (state & (1 << 15)) != 0
        data.batteryTooHigh = (state & (1 << 16)) != 0
        data.timerElapsed = (state & (1 << 17)) != 0
        data.notEnoughPower = (state & (1 << 18)) != 0
        data.angelsOutOufRange = (state & (1 << 19)) != 0
        data.tooMuchWind = (state & (1 << 20)) != 0
        data.ultrasonicSensorDeaf = (state & (1 << 21)) != 0
        data.cutoutSystemDetected = (state & (1 << 22)) != 0
        data.PICVersionNumberOK = (state & (1 << 23)) != 0
        data.ATCodedThreadOn = (state & (1 << 24)) != 0
        data.navDataThreadOn = (state & (1 << 25)) != 0
        data.videoThreadOn = (state & (1 << 26)) != 0
        data.acquisitionThreadOn = (state & (1 << 27)) != 0
        data.controlWatchdogDelayed = (state & (1 << 28)) != 0
        data.ADCWatchdogDelayed = (state & (1 << 29)) != 0
        data.communicationProblemOccurred = (state & (1 << 30)) != 0
        data.emergency = (state & (1 << 31)) != 0
    }
    
    func printState()
    {
        var s: String = String()
        
        s += "IsFlying: \(self.isFlying())\n"
        s += "IsVideoEnabled: \(self.isVideoEnabled())\n"
        s += "IsVisionEnabled: \(self.isVisionEnabled())\n"
        s += "controlAlgo: \(self.getControlAlgorithm())\n"
        s += "AltitudeControlActive: \(self.isAltitudeControlActive())\n"
        s += "IsUserFeedbackOn: \(self.isUserFeedbackOn())\n"
        s += "ControlReceived: \(self.isVideoEnabled())\n"
        s += "IsTrimReceived: \(self.isTrimReceived())\n"
        s += "IsTrimRunning: \(self.isTrimRunning())\n"
        s += "IsTrimSucceeded: \(self.isTrimSucceeded())\n"
        s += "IsNavDataDemoOnly: \(self.isNavDataDemoOnly())\n"
        s += "IsNavDataBootstrap: \(self.isNavDataBootstrap())\n"
        s += "IsMotorsDown: \(self.isMotorsDown())\n"
        s += "IsGyrometersDown: \(self.isGyrometersDown())\n"
        s += "IsBatteryLow: \(self.isBatteryTooLow())\n"
        s += "IsBatteryHigh: \(self.isBatteryTooHigh())\n"
        s += "IsTimerElapsed: \(self.isTimerElapsed())\n"
        s += "isNotEnoughPower: \(self.isNotEnoughPower())\n"
        s += "isAngelsOutOufRange: \(self.isAngelsOutOufRange())\n"
        s += "isTooMuchWind: \(self.isTooMuchWind())\n"
        s += "isUltrasonicSensorDeaf: \(self.isUltrasonicSensorDeaf())\n"
        s += "isCutoutSystemDetected: \(self.isCutoutSystemDetected())\n"
        s += "isPICVersionNumberOK: \(self.isPICVersionNumberOK())\n"
        s += "isATCodedThreadOn: \(self.isATCodedThreadOn())\n"
        s += "isNavDataThreadOn: \(self.isNavDataThreadOn())\n"
        s += "isVideoThreadOn: \(self.isVideoThreadOn())\n"
        s += "isAcquisitionThreadOn: \(self.isAcquisitionThreadOn())\n"
        s += "isControlWatchdogDelayed: \(self.isControlWatchdogDelayed())\n"
        s += "isADCWatchdogDelayed: \(self.isADCWatchdogDelayed())\n"
        s += "isCommunicationProblemOccurred: \(self.isCommunicationProblemOccurred())\n"
        s += "IsEmergency: \(self.isEmergency())\n"
        s += "CtrlState: \(self.getControlState())\n"
        s += "Battery: \(self.getBattery())\n"
        s += "Altidtude: \(self.getAltitude())\n"
        s += "Pitch: \(self.getPitch())\n"
        s += "Roll: \(self.getRoll())\n"
        s += "Yaw: \(self.getYaw())\n"
        s += "X velocity: \(self.getVx())\n"
        s += "Y velocity: \(self.getLongitude())\n"
        s += "Z velocity: \(self.getVz())\n"
        s += "Vision Tags: \(self.getVisionTags())\n"
        
        //log.fine("State: \(s)")
        print("Fine: State: \(s)")
    }
    
}