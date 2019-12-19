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
        
        let frame: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 38.711046,
                                                                longitude: -9.160096,
                                                                zoom: 15.0)
        MapView.camera = frame
        
        getAllDataLocation() { (json) in
            self.locData = json as! [ModelLocation]
            
            DispatchQueue.main.async {
                
                for index in 0..<self.locData.count {
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: self.locData[index].y, longitude: self.locData[index].x)
                    marker.title = "Id: \(self.locData[index].name)"
                    marker.snippet = "Company: \(self.locData[index].companyZoneId)"
                    // GMSMarker.markerImage(with: .blue)
                    marker.map = self.MapView
                    
                }
            }
        }
    }
    
    
    
}





