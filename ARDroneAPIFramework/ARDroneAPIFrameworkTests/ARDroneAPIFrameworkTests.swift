//
//  ARDroneAPIFrameworkTests.swift
//  ARDroneAPIFrameworkTests
//
//  Created by Mickael Goualard on 30/03/16.
//  Copyright © 2016 Mickael Goualard. All rights reserved.
//

import XCTest
@testable import ARDroneAPIFramework

import CocoaAsyncSocket

class ARDroneAPIFrameworkTests: XCTestCase {
    
    var outSocket : OutSocket!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        outSocket = OutSocket()
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
