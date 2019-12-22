//
//  MoveAndGoTests.swift
//  MoveAndGoTests
//
//  Created by MAC on 17/12/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import XCTest

class MoveAndGoTests: XCTestCase {
    
    var locationTestOK: ModelLocation = ModelLocation(name: "Rossio", companyZoneId: 402, x: -9.1424, y: 38.71497)
    
    func testDataLocationExistense(){
        XCTAssertNotNil(locationTestOK)
    }
    
    func testDecodeLocation(){
        guard let path = Bundle(for: type(of: self)).path(forResource: "dataJson", ofType: "json") else {
            XCTFail()
            return
        }
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            let locations = try decoder.decode([ModelLocation].self, from: data)
            XCTAssertNotNil(locations)
            
            for element in locations{
                XCTAssertNotNil(element.name)
                XCTAssertNotNil(element.companyZoneId)
                XCTAssertNotNil(element.x)
                XCTAssertNotNil(element.y)
            }
        }catch{
            XCTFail()
        }
    }
    
}
