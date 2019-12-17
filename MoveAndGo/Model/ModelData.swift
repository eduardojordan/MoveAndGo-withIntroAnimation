//
//  ModelData.swift
//  MoveAndGo
//
//  Created by MAC on 17/12/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import Foundation


struct DataLocation: Decodable {
  let name: String
  let companyZoneId: Int
  let x:Double
  let y:Double
    
    init(name: String, companyZoneId:Int, x:Double, y:Double){
        self.name = name
        self.companyZoneId = companyZoneId
        self.x = x
        self.y = y
    }
}
