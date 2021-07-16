//
//  MapInfoVC.swift
//  Earthquake
//
//  Created by Eray Erman on 2.07.2021.
//

import UIKit
import MapKit
import CoreLocation

class MapInfoVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var innerInfoView: InfoView!
    @IBOutlet weak var infoMap: MKMapView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var mdLabel: UILabel!
    @IBOutlet weak var mlLabel: UILabel!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var rightView: UIView!
   
    var locationManager = CLLocationManager()
    
    
    var viewModel: MapInfoVM!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Depremler"
        infoMap.delegate = self
        locationManager.delegate = self
        setupUI()
        
        
        
        
        
    }
    func setupUI(){
        
        infoView.layer.cornerRadius = 10
        
        rightView.layer.cornerRadius = 8
        middleView.layer.cornerRadius = 8
        leftView.layer.cornerRadius = 8
        innerInfoView.setupUI(model: viewModel.data)
        latitudeLabel.text = String(viewModel.data.latitude!) + " N"
        longitudeLabel.text = String(viewModel.data.longitude!) + " E"
        mdLabel.text = String(viewModel.data.md!)
        mlLabel.text = String(viewModel.data.ml!)
        
        let location = CLLocationCoordinate2D(latitude: viewModel.data.latitude!, longitude: viewModel.data.longitude!)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        infoMap.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        self.infoMap.addAnnotation(annotation)

        
        
    }
 


}


