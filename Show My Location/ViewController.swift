//
//  ViewController.swift
//  Show My Location
//Users/spliced/Desktop/Xcode Projects/Show My Location/Show My Location/ViewController.swift
//
//  Created by Jonathan Rhea on 4/11/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var latitude: Double?
    var longitude: Double?
    var altitude: Double?
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var myLatitude: UITextField!
    @IBOutlet weak var myLongitude: UITextField!
    @IBOutlet weak var myAltitude: UITextField!
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        
        if status == .authorizedWhenInUse{
            print("GPS Allowed")
            myMap.showsUserLocation = true
        }//end if
        else{
            print("GPS Not Allowed")
            return
        }//end else
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let myCoordinate = locationManager.location?.coordinate
        altitude = locationManager.location?.altitude
        latitude = myCoordinate?.latitude
        longitude = myCoordinate?.longitude
        
        myLatitude.text = String(latitude!)
        myLongitude.text = String(longitude!)
        myAltitude.text = String(altitude!)
    }
}

