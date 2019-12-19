//
//  DataLocation.swift
//  MoveAndGo
//
//  Created by MAC on 18/12/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import Foundation
import UIKit


func getAllDataLocation( Completion block: @escaping ((NSArray) -> ())){
    
    let urlString = URL(string: "https://apidev.meep.me/tripplan/api/v1/routers/lisboa/resources?lowerLeftLatLon=38.711046,-9.160096&upperRightLatLon=38.739429,-9.137115")
    
    let task = URLSession.shared.dataTask(with: urlString!) { data, response, error in
        guard error == nil else {
            print ("error: \(error!)")
            return
        }
        guard let data = data else {
            print("No data")
            return
        }
        if let json = try? JSONDecoder().decode([ModelLocation].self, from: data){
            block(json as NSArray)
           
        } else{
            print ("error: \(error!)")
        }
    }
    task.resume()
    
}

