//
//  ShortWalkMapViewController.swift
//  Butz_CampusWalk
//
//  Created by Bryan Butz on 11/15/18.
//  Copyright © 2018 Bryan Butz. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Foundation

class ShortWalkMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
{

    @IBOutlet weak var mapView: MKMapView!
    
    // Create a building object to hold the json data
    var building = [NIUBuilding]()
    
    // Create a location manager
    let locMgr = CLLocationManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        fetchJsonData()
        
        sleep(2)
        
        
        locMgr.delegate = self
        
        // Prepare to get user's location.
        locMgr.desiredAccuracy = kCLLocationAccuracyBest
        
        // Ask the user before obtaining his/her location data
        locMgr.requestWhenInUseAuthorization()
        
        
        var myLocCoordinate = CLLocationCoordinate2D(latitude: 41.935385, longitude: 88.765015 )
        
        
         for index in 0...10
         {
            let latitude = Double(building[index].Latitude!)
            let longitude = Double(building[index].Longitude!)
            
            
            //Creating 2D location coordinate
            myLocCoordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude! )
            
           //Create custom annotation using the CustomAnnotation class
            let annotationPin = CustomAnnotation(pinTitle: building[index].BuildingName! , pinSubTitle: building[index].Facts! , location: myLocCoordinate)
        
           //Adding custom annotation to map view
           mapView.addAnnotation(annotationPin)
        
         }
    
    
    //Indicating zoom distance
    let mapRegion = MKCoordinateRegionMakeWithDistance(myLocCoordinate, 500, 500)
    
    //Setting the region for the map veiw
    self.mapView.setRegion(mapRegion, animated: true)
    }
    
    
    
    
    /* This function tells the delegate to get the user's permission to use his/her location. */
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        switch  status
        {
        case .denied, .restricted:
            print("no authorization")
        case .notDetermined:
            locMgr.requestWhenInUseAuthorization()
        default: // Good to go
            locMgr.startUpdatingLocation()
        }
    }
    
    
    /*
     This function tells the delegate that new data is available.  It is in the parameter, "locations."  Therefore, we get the current user location and display it on the map with the blue circle.
     */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        // Get the new location
        let newLocation = locations[0]
        
        // Prepare to display it on the map.
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.005, 0.005)
        let currentLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(currentLocation, span)
        mapView.setRegion(region, animated: true)
        
        // Display the location on the map
        self.mapView.showsUserLocation = true
        
        // Just want to know the user's moving speed
        print(newLocation.speed)
    }
    
    
    
    
    /*  This function submits a url request to get the json
     formatted data from the source as indicated in url string.  */
    func fetchJsonData()
    {
        
        let jsonURL = "https://api.myjson.com/bins/esdma"
        guard let url = URL(string: jsonURL) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let jsonData = data else { return }
            
            // To view data as string before parsing.
            //let stringData = String(data: jsonData, encoding: .utf8)
            //print(stringData as Any)
            
            do {
                self.building = try JSONDecoder().decode([NIUBuilding].self, from: jsonData)
                
                //print(buildings)    // After parsing/decoding
                
                for eachPres in self.building
                {
                    print(eachPres.Number!, (eachPres.BuildingName as String?)! + "|", (eachPres.BuildingCode as String?)! + "|", (eachPres.City as String?)! + "|",  (eachPres.State as String?)! + "|", (eachPres.Latitude as String?)!, "|", (eachPres.Longitude as String?)!, "|", (eachPres.BuildingImage as String?)! + "|", (eachPres.Facts as String?)! )
                }
                
                
            } catch let jsonErr {
                print ("Error Reading JSON: ", jsonErr)
            }
            
            
            }     //URLSession
            .resume()
        
    }

    
    
    
    
}
