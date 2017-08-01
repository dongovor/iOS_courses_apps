//
//  ViewController.swift
//  MapViewApp
//
//  Created by Dmitry Cherkasov on 7/28/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    var manager = CLLocationManager()
    var lat = 40.7485413
    var long = -73.98575770000002
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: long), span: span)
        let pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        let objectAnnotation = MKPointAnnotation()
        mapView.setRegion(region, animated: true)
        objectAnnotation.coordinate = pinLocation
        objectAnnotation.title = "Empire State Building"
        objectAnnotation.subtitle = "350 5th Ave, New York, NY 10118, USA"
        self.mapView.addAnnotation(objectAnnotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func mapType(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0 {
            mapView.mapType = MKMapType.standard
        }
        
        if segmentControl.selectedSegmentIndex == 1 {
            mapView.mapType = MKMapType.satellite
        }
        
        if segmentControl.selectedSegmentIndex == 2 {
            mapView.mapType = MKMapType.hybrid
        }

    }
    
    @IBAction func locateMe(_ sender: Any) {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0] as CLLocation
        manager.stopUpdatingLocation()
        let location = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func directions(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://maps.apple.com/maps?daddr=\(lat),\(long)")!)
    }
    
}

