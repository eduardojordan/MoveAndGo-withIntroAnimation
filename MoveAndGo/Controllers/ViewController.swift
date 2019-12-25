//
//  ViewController.swift
//  MoveAndGo
//
//  Created by MAC on 17/12/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import UIKit
import GoogleMaps
import BLTNBoard

class ViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate{
    
    var locData = [ModelLocation]()
    var locationManager = CLLocationManager()

    
    lazy var bulletinManager: BLTNItemManager = {
        let rootItem: BLTNPageItem = BLTNPageItem(title: "ALGO")
        return BLTNItemManager(rootItem: rootItem)
    }()
    
    @IBOutlet weak var MapView: GMSMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        MapView.delegate = self
        MapView.isMyLocationEnabled = true
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
//        let frame: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 38.711046,
//                                                                longitude: -9.160096,
//                                                                zoom: 16.0)
        
        let frame: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 38.7236190172 ,
                                                                   longitude: -9.1517000432,
                                                                   zoom: 16.0)
       
        
        MapView.camera = frame
        
        getAllDataLocation() { (json) in
            self.locData = json as! [ModelLocation]
            
            
            let page = BLTNPageItem(title: "Push Notifications")
            page.image = UIImage(named: "car")
            page.descriptionText = "Description Text"
            
            DispatchQueue.main.async {
                
                for index in 0..<self.locData.count {
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: self.locData[index].y, longitude: self.locData[index].x)
                    
                    if self.locData[index].companyZoneId == 402 {
                        marker.icon = UIImage(named: "car")
                        marker.snippet = "Super Car"
                        marker.title = "\(self.locData[index].name)"
                    } else if  self.locData[index].companyZoneId == 378 {
                        marker.icon = UIImage(named: "Bici")
                        marker.snippet = "Happy Bike"
                        marker.title = "\(self.locData[index].name)"
                    } else if  self.locData[index].companyZoneId == 382 {
                        marker.icon = UIImage(named: "bus")
                        marker.snippet = "Public Bus"
                        marker.title = "\(self.locData[index].name)"
                    } else if self.locData[index].companyZoneId == 545 {
                        marker.icon = UIImage(named: "drone")
                        marker.snippet = "Go & Fly"
                        marker.title = "\(self.locData[index].name)"
                    } else if self.locData[index].companyZoneId == 467 {
                        marker.icon = UIImage(named: "moto")
                        marker.snippet = "Moto Flash "
                        marker.title = "\(self.locData[index].name)"
                    } else if self.locData[index].companyZoneId == 473 {
                        marker.icon = UIImage(named: "patinete")
                        marker.snippet = "One Patinete"
                        marker.title = "\(self.locData[index].name)"
                    } else if self.locData[index].companyZoneId == 412 {
                        marker.icon = UIImage(named: "drone")
                        marker.snippet = "Drone Delivery"
                        marker.title = "\(self.locData[index].name)"
                    }
                    
                    marker.setIconSize(scaledToSize: .init(width: 30, height: 30))
                    marker.map = self.MapView
                    
                }
            }
        }
    }
    
    
    func showDynamicBulletin(dynamicTitle: String, dynamicDescription: String, imageIcon:UIImage) {
        
        let page = BLTNPageItem(title: dynamicTitle)
        page.descriptionText = dynamicDescription
        page.image = imageIcon
        
        page.actionButtonTitle = "Go to App"
        page.actionHandler = { (item: BLTNActionItem) in
            print("Make call to App or Reservation")
        }
        
        self.bulletinManager = BLTNItemManager(rootItem: page)
        self.bulletinManager.backgroundViewStyle = .dimmed
        self.bulletinManager.showBulletin(above: self)
    }
    
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        if  marker.snippet == "Super Car" {
            self.showDynamicBulletin(dynamicTitle: "Super Car", dynamicDescription: marker.title!, imageIcon: UIImage(named: "car")!)
        } else if marker.snippet == "Happy Bike"{
            self.showDynamicBulletin(dynamicTitle: "Happy Bike", dynamicDescription: marker.title!, imageIcon: UIImage(named: "Bici")!)
        }else if marker.snippet == "Public Bus"{
            self.showDynamicBulletin(dynamicTitle: "Public Bus", dynamicDescription: marker.title!, imageIcon: UIImage(named: "bus")!)
        }else if marker.snippet == "Go & Fly"{
            self.showDynamicBulletin(dynamicTitle: "Go & Fly", dynamicDescription: marker.title!, imageIcon: UIImage(named: "drone")!)
        }else if marker.snippet == "Moto Flash "{
            self.showDynamicBulletin(dynamicTitle: "Moto Flash ", dynamicDescription: marker.title!, imageIcon: UIImage(named: "moto")!)
        }else if marker.snippet == "One Patinete"{
            self.showDynamicBulletin(dynamicTitle: "One Patinete", dynamicDescription: marker.title!, imageIcon: UIImage(named: "patinete")!)
        }else if marker.snippet == "Drone Delivery"{
            self.showDynamicBulletin(dynamicTitle: "Drone Delivery", dynamicDescription: marker.title!, imageIcon: UIImage(named: "drone")!)
        }
        
        return true
    }
    
    private func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let location = locations.last

        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)

        self.MapView?.animate(to: camera)


        self.locationManager.stopUpdatingLocation()

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



// Pendiente Instalar cluster para Map de Google

