//
//  InfoView.swift
//  Earthquake
//
//  Created by Eray Erman on 16.07.2021.
//

import Foundation
import  UIKit

class InfoView : BaseView {
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftSecondView: UIView!
    @IBOutlet weak var rightSecondView: UIView!
    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var deptLabel: UILabel!
    
    
    var mdlabel : String = ""
    
    func setupUI(model: EQDataModel) {
        leftView.layer.cornerRadius = leftView.frame.size.height/2
        leftSecondView.layer.cornerRadius = leftSecondView.frame.size.height/2
        self.dateLabel.text = model.date
        self.magnitudeLabel.text = model.ml
        self.magnitudeLabel.textColor = UIColor.white
        self.deptLabel.text = String(model.depth!) + " km"
        self.placeLabel.text = model.place
        
        let doubleMag = Double(magnitudeLabel.text!)
        self.mdlabel = model.md!
        
        
        // Setting Colors
        
        switch doubleMag! {
        case 2.0..<3 :
            leftView.backgroundColor = UIColor(red: 0.51, green: 0.81, blue: 0.50, alpha: 0.3)
            leftSecondView.backgroundColor = UIColor(red: 0.51, green: 0.81, blue: 0.50, alpha: 1.00)
        case 3.0..<4:
            leftView.backgroundColor = UIColor(red: 0.64, green: 0.81, blue: 0.42, alpha: 0.3)
            leftSecondView.backgroundColor = UIColor(red: 0.64, green: 0.81, blue: 0.42, alpha: 1.00)
        case 4.0..<5 :
            leftView.backgroundColor = UIColor(red: 0.77, green: 0.79, blue: 0.37, alpha: 0.3)
            leftSecondView.backgroundColor = UIColor(red: 0.77, green: 0.79, blue: 0.37, alpha: 1.00)
        case 5.0..<6 :
            leftView.backgroundColor = UIColor(red: 0.78, green: 0.71, blue: 0.41, alpha: 0.3)
            leftSecondView.backgroundColor = UIColor(red: 0.78, green: 0.71, blue: 0.41, alpha: 1.00)
        case 6.0..<7 :
            leftView.backgroundColor = UIColor(red: 0.75, green: 0.58, blue: 0.32, alpha: 0.3)
            leftSecondView.backgroundColor = UIColor(red: 0.75, green: 0.58, blue: 0.32, alpha: 1.00)
        case 7.0..<8 :
            leftView.backgroundColor = UIColor(red: 0.73, green: 0.42, blue: 0.22, alpha: 0.3)
            leftSecondView.backgroundColor = UIColor(red: 0.73, green: 0.42, blue: 0.22, alpha: 1.00)
        case 8.0..<9 :
            leftView.backgroundColor = UIColor(red: 0.75, green: 0.25, blue: 0.14, alpha: 0.3)
            leftSecondView.backgroundColor = UIColor(red: 0.75, green: 0.25, blue: 0.14, alpha: 1.00)
        case 9.0..<10 :
            leftView.backgroundColor = UIColor(red: 0.73, green: 0.15, blue: 0.10, alpha: 0.3)
            leftSecondView.backgroundColor = UIColor(red: 0.73, green: 0.15, blue: 0.10, alpha: 1.00)
        case 10.0..<11 :
            leftView.backgroundColor = UIColor(red: 0.62, green: 0.12, blue: 0.09, alpha: 0.3)
            leftSecondView.backgroundColor = UIColor(red: 0.62, green: 0.12, blue: 0.09, alpha: 1.00)
        default:
            leftView.backgroundColor = UIColor(red: 0.52, green: 0.79, blue: 0.70, alpha: 0.3)
            leftSecondView.backgroundColor = UIColor(red: 0.52, green: 0.79, blue: 0.70, alpha: 1.00)
        }
        
    }

}

