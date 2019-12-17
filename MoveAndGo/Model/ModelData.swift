//
//  ModelData.swift
//  MoveAndGo
//
//  Created by MAC on 17/12/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import Foundation


struct DataLocation {
    let name: String
    let companyZoneId: Int
    let x:Double
    let y:Double
    
    //    init(name: String, companyZoneId:Int, x:Double, y:Double){
    //        self.name = name
    //        self.companyZoneId = companyZoneId
    //        self.x = x
    //        self.y = y
    //    }
}

extension DataLocation: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case companyZoneId
        case x
        case y
    }
    
    init(from decoder: Decoder)throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        companyZoneId = try container.decode(Int.self, forKey: .companyZoneId)
        x = try container.decode(Double.self, forKey: .x)
        y = try container.decode(Double.self, forKey: .y)
    }
    
}
