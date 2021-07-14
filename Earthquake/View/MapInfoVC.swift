//
//  MapInfoVC.swift
//  Earthquake
//
//  Created by Eray Erman on 2.07.2021.
//

import UIKit
import MapKit

class MapInfoVC: UIViewController {

    @IBOutlet weak var infoMap: MKMapView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var mdLabel: UILabel!
    @IBOutlet weak var mlLabel: UILabel!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var rightView: UIView!
   @IBOutlet weak var tableViewCell: TableViewCell!
    
    
    let viewModel = ViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Depremler"
        setupUI()
        
        
    }
    func setupUI(){
        
        infoView.layer.cornerRadius = 10
        
        rightView.layer.cornerRadius = 8
        middleView.layer.cornerRadius = 8
        leftView.layer.cornerRadius = 8
        /*
        latitudeLabel.text = String(tableViewCell.latitude)
        longitudeLabel.text = String(tableViewCell.longitude)
        //mlLabel.text = tableViewCell.magnitudeLabel.text
        mdLabel.text = tableViewCell.mdlabel
        */
    }


}
