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
                
                
                
                
                
                
                
//
//                for i in 0..<self.locData.count {
//                    var locator: LocationDetails? = locatorObject.locationList[i]
//                    var position: CLLocationCoordinate2D = CLLocationCoordinate2DMake(locator?.lat, locator?.long)
//                    var marker = GMSMarker(position: position)
//                   // marker.title = locator?.address
//                    marker.map = self.MapView
//                }

                
                
                
                
                
                
            }
//            for index in 0..<self.locData.count {
//                   let marker = GMSMarker()
//                marker.position = CLLocationCoordinate2D(latitude: index.x, longitude: index.y)
////                   marker.title = "Marker number: \(index)"
////                   marker.snippet = "Marker's Lat: \(arrayLat[index]), Marker's Lon: \(arrayLon[index])"
//                   marker.map = self.MapView
//                //   print("Index: \(index)")
//               }
            
        }
        
//        print("xxxx",locData)
//        
//        for element in locData {
//            let position = CLLocationCoordinate2D(latitude: element.x, longitude: element.y)
//            let marker = GMSMarker(position: position)
//            marker.title = element.name
//            
//            marker.map = MapView
//        }
        
        
        
        

//        DispatchQueue.global(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0).async() {
//            for location in locationsArrayFromSomeWhere {
//
//                dispatch_async(dispatch_get_main_queue()) {
//                    let placeMarker = PlaceMarker(coordinate: location.coordinate)
//
//                    placeMarker.map = self.mapView
//                }
//            }
//        }
           
        
        
        
        
//                let position = CLLocationCoordinate2D(latitude: 38.71497, longitude: -9.1424)
//                let marker = GMSMarker(position: position)
//                marker.title = "HRossio"
//                marker.map = MapView
        
     
        
//        for element in self.locData {
//            let position = CLLocationCoordinate2D(latitude: element.x, longitude: element.y)
//            let marker = GMSMarker(position: position)
////            marker.title = element.name
////            print("-->",self.locData.count)
//            marker.map = MapView
//       }
        
        
        
        //        let marker = GMSMarker()
        //                     marker.position = CLLocationCoordinate2D(latitude: 38.71497, longitude: -9.1424)
        //                     marker.title = "Jow Loove"
        //                     marker.snippet = "California"
        //                     marker.map = self.MapView
        
        //        let position = CLLocationCoordinate2D(latitude: 38.71497, longitude: -9.1424)
        //        let marker = GMSMarker(position: position)
        //        marker.title = "HRossio"
        //        marker.map = MapView
        
        
        
        
    }
    
    


