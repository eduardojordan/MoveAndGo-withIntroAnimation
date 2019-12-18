//
//  ViewController.swift
//  MoveAndGo
//
//  Created by MAC on 17/12/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    var locData = [ModelLocation]()
    
    @IBOutlet weak var MapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAllDataLocation() { (json) in
            self.locData = json as! [ModelLocation]
           // print("XXX--",self.locData)
        }
        
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 38.711046, longitude: -9.160096, zoom: 12.0)
        MapView.camera = camera
    }
    
    
}

