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
                    marker.title = "\(self.locData[index].name)"
         
                    if self.locData[index].companyZoneId == 402 {
                        marker.icon = UIImage(named: "car")
                        marker.snippet = "Super Car"
                    } else if  self.locData[index].companyZoneId == 378 {
                        marker.icon = UIImage(named: "Bici")
                        marker.snippet = "Happy Bici"
                    } else if  self.locData[index].companyZoneId == 382{
                        marker.icon = UIImage(named: "bus")
                        marker.snippet = "Public Bus"
                    } else if self.locData[index].companyZoneId == 545{
                        marker.icon = UIImage(named: "drone")
                        marker.snippet = "Go & Fly"
                    } else if self.locData[index].companyZoneId == 467{
                        marker.icon = UIImage(named: "moto")
                        marker.snippet = "Moto Flash "
                    } else if self.locData[index].companyZoneId == 473{
                        marker.icon = UIImage(named: "patinete")
                        marker.snippet = "One Step"
                    } else if self.locData[index].companyZoneId == 412{
                        marker.icon = UIImage(named: "drone")
                        marker.snippet = "Drone Delivery"
                    }     else {
                        marker.icon = UIImage(named: "drone")
                    }
                    
                    marker.setIconSize(scaledToSize: .init(width: 30, height: 30))
                    marker.map = self.MapView
                    
                }
            }
        }
    }
    
}
extension GMSMarker {
    func setIconSize(scaledToSize newSize: CGSize) {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        icon?.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        icon = newImage
    }
}




