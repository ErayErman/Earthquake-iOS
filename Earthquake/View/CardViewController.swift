//
//  CardViewController.swift
//  Earthquake
//
//  Created by Eray Erman on 26.07.2021.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var innerInfoView: InfoView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var mdLabel: UILabel!
    @IBOutlet weak var mlLabel: UILabel!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var rightView: UIView!
    
    var viewModel: MapInfoVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCard()
    }
    
    func setupCard(){
        infoView.layer.cornerRadius = 10
        
        rightView.layer.cornerRadius = 8
        middleView.layer.cornerRadius = 8
        leftView.layer.cornerRadius = 8
        innerInfoView.setupUI(model: viewModel.data)
        latitudeLabel.text = String(viewModel.data.latitude!) + " N"
        longitudeLabel.text = String(viewModel.data.longitude!) + " E"
        mdLabel.text = String(viewModel.data.md!)
        mlLabel.text = String(viewModel.data.ml!)
        
        
    }


}
