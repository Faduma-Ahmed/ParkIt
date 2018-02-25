//
//  UserDashboardViewController.swift
//  Park-It
//
//  Created by Kinshuk Singh on 2018-02-24.
//  Copyright © 2018 Kinshuk. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class UserDashboardViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    @IBOutlet weak var optionsTextField: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        optionsTextField.target = self.revealViewController()
        optionsTextField.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        var location = CLLocationCoordinate2DMake(43.78687,-79.18959)
        
        var location2 = CLLocationCoordinate2DMake(43.7868,-79.18959)
        var location3 = CLLocationCoordinate2DMake(43.78687,-79.1895)
        var location4 = CLLocationCoordinate2DMake(43.7868,-79.1895)
        
        var annotation2 = MKPointAnnotation()
        annotation2.coordinate = location2
        annotation2.title = "UofT Parking Lot 1"
        annotation2.subtitle = "UofT Parking Lot 1"
        mapView.addAnnotation(annotation2)
        
        var annotation3 = MKPointAnnotation()
        annotation3.coordinate = location3
        annotation3.title = "UofT Parking Lot 2"
        annotation3.subtitle = "UofT Parking Lot 2"
        mapView.addAnnotation(annotation3)
        
        var annotation4 = MKPointAnnotation()
        annotation4.coordinate = location4
        annotation4.title = "UofT Parking Lot 3"
        annotation4.subtitle = "UofT Parking Lot 3"
        mapView.addAnnotation(annotation4)
        
        var span = MKCoordinateSpanMake(0.02,0.02)
        var region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Current Location"
        annotation.subtitle = "Current Location"
        mapView.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//
//  ViewController.swift
//  HV2
//
//  Created by Faduma Ahmed on 2018-02-23.
//  Copyright © 2018 Faduma Ahmed. All rights reserved.
//
//
//import UIKit
//import GoogleMaps
//import GooglePlaces
//import CoreLocation
//
//class ViewController: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate {
//    let locationManager = CLLocationManager()
//    var googleMapView: GMSMapView!
//
//    override func viewDidLoad() {
//
//        // Ask for Authorisation from the User.
//        self.locationManager.requestAlwaysAuthorization()
//
//        // For use in foreground
//        self.locationManager.requestWhenInUseAuthorization()
//
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            locationManager.startUpdatingLocation()
//        }
//
//    }
//
//
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
//        let camera = GMSCameraPosition.camera(withLatitude: locValue.latitude, longitude: locValue.longitude, zoom: 15.0)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        mapView.isMyLocationEnabled = true
//        view = mapView
//
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)
//        marker.title = "Your Location"
//        marker.map = mapView
//
//        // Creates a marker in the center of the map.
//        let marker2 = GMSMarker()
//        marker2.position = CLLocationCoordinate2D(latitude: 43.783, longitude: -79.187036499999)
//        marker2.title = "Parking Lot 1"
//        marker2.snippet = "0.02 km"
//        marker2.map = mapView
//
//        // Creates a marker in the center of the map.
//        let marker3 = GMSMarker()
//        marker3.position = CLLocationCoordinate2D(latitude: 43.784215, longitude: -79.18708753)
//        marker3.title = "Parking Lot 2"
//        marker3.snippet = "0.1 km"
//        marker3.map = mapView
//
//        // Creates a marker in the center of the map.
//        let marker4 = GMSMarker()
//        marker4.position = CLLocationCoordinate2D(latitude: 43.789818, longitude: -79.192361)
//        marker4.title = "Parking Lot 3"
//        marker4.snippet = "1.2  km"
//        marker4.map = mapView
//        locationManager.stopUpdatingLocation()
//
//    }
//
//
//}

