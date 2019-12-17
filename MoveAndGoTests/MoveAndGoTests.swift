//
//  MoveAndGoTests.swift
//  MoveAndGoTests
//
//  Created by MAC on 17/12/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import XCTest

class MoveAndGoTests: XCTestCase {

    var locationTestOK: DataLocation = DataLocation(name: "Rossio", companyZoneId: 402, x: -9.1424, y: 38.71497)
       
       func testDataLocationExistense(){
           XCTAssertNotNil(locationTestOK)
       }

}
