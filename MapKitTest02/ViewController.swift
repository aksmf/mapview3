//
//  ViewController.swift
//  MapKitTest02
//
//  Created by D7703_15 on 2019. 9. 16..
//  Copyright © 2019년 bohyun. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    var pins = [MKPointAnnotation]()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        mapView.mapType = MKMapType.standard
        
        let location = CLLocationCoordinate2D(latitude: 35.165964, longitude: 129.072543)
        
        let pin1 = MKPointAnnotation()
        pin1.coordinate = location
        pin1.title = "동의과학대학교"
        pin1.subtitle = "DIT"
        //mapView.addAnnotation(pin1)
        pins.append(pin1)

        let pin2 = MKPointAnnotation()
        pin2.coordinate.latitude = 35.1681824
        pin2.coordinate.longitude = 129.0556455
        pin2.title = "부산 시민공원"
        pin2.subtitle = "랜크마크"
        //mapView.addAnnotation(pin2)
        pins.append(pin2)
        
        let pin3 = MKPointAnnotation()
        pin3.coordinate.latitude = 35.147919
        pin3.coordinate.longitude = 129.130123
        pin3.title = "광안대교"
        pin3.subtitle = "랜드마크"
        //mapView.addAnnotation(pin3)
        pins.append(pin3)
        
        let pin4 = MKPointAnnotation()
        pin4.coordinate.latitude = 35.0517554
        pin4.coordinate.longitude = 129.0856113
        pin4.title = "태종대"
        pin4.subtitle = "해변 전망대가 있는 고지대 공원"
        //mapView.addAnnotation(pin4)
        pins.append(pin4)
        
        mapView.showAnnotations(pins, animated: true)
    }
    
    @IBAction func standardTypeButton(_ sender: Any) {
        mapView.mapType = MKMapType.standard
    }
    
    @IBAction func hybridTypeButton(_ sender: Any) {
        mapView.mapType = MKMapType.hybrid
    }
    
    @IBAction func satelliteTypeButton(_ sender: Any) {
        mapView.mapType = MKMapType.satellite
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "RE"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
            annotationView?.animatesDrop = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            
        } else {
            annotationView!.annotation = annotation
        }
        
        var imgV = UIImageView()
        
        if annotation.title! == "동의과학대학교"  {
            annotationView?.pinTintColor = UIColor.red
            imgV = UIImageView(image: UIImage(named: "dit.png"))
        } else if annotation.title! == "부산 시민공원"  {
            annotationView?.pinTintColor = UIColor.green
            imgV = UIImageView(image: UIImage(named: "cat.jpg"))
        } else if annotation.title! == "광안대교"  {
            annotationView?.pinTintColor = UIColor.blue
            imgV = UIImageView(image: UIImage(named: "광안대교.png"))
        } else {
            annotationView?.pinTintColor = UIColor.yellow
            imgV = UIImageView(image: UIImage(named: "태종대.png"))
        }
        
        imgV.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        annotationView?.leftCalloutAccessoryView = imgV
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        let alert = UIAlertController(title: (view.annotation?.title)!, message: (view.annotation?.subtitle)!, preferredStyle: .alert)
        
        let ok = UIAlertAction(title:"확인", style: .default)
        
        alert.addAction(ok)
        
        self.present(alert, animated: false)
        
    }
}

