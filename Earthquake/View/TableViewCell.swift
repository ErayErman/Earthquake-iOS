//
//  TableViewCell.swift
//  Earthquake
//
//  Created by Eray Erman on 30.06.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftSecondView: UIView!
    @IBOutlet weak var rightSecondView: UIView!
    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var deptLabel: UILabel!
    
    var latitude : Double = 0.0
    var longitude : Double = 0.0
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
        self.latitude = model.latitude!
        self.longitude = model.longitude!
        self.mdlabel = model.md!
        
        
        // Setting Colors
        /*
        if doubleMag! < 2.0 {
            leftView.backgroundColor = UIColor.gray
            leftSecondView.backgroundColor = UIColor.gray
        }else if doubleMag! >= 2.0 && doubleMag! < 3.0{
            leftView.backgroundColor = UIColor.green
            leftSecondView.backgroundColor = UIColor.green
        }else if doubleMag! >= 3.0 && doubleMag! < 4.0{
            leftView.backgroundColor = UIColor.green
            leftSecondView.backgroundColor = UIColor.green
        }else if doubleMag! >= 4.0 && doubleMag! < 5.0{
            leftView.backgroundColor = UIColor.green
            leftSecondView.backgroundColor = UIColor.green
        }else if doubleMag! >= 5.0 && doubleMag! < 6.0{
            leftView.backgroundColor = UIColor.green
            leftSecondView.backgroundColor = UIColor.green
        }else if doubleMag! >= 6.0 && doubleMag! < 7.0{
            leftView.backgroundColor = UIColor.green
            leftSecondView.backgroundColor = UIColor.green
        }else if doubleMag! >= 7.0 && doubleMag! < 8.0{
            leftView.backgroundColor = UIColor.green
            leftSecondView.backgroundColor = UIColor.green
        }else if doubleMag! >= 8.0 && doubleMag! < 9.0{
            leftView.backgroundColor = UIColor.green
            leftSecondView.backgroundColor = UIColor.green
        }else if doubleMag! >= 9.0 && doubleMag! < 10.0{
            leftView.backgroundColor = UIColor.green
            leftSecondView.backgroundColor = UIColor.green
        }else if doubleMag! >= 10.0 && doubleMag! < 11.0{
            leftView.backgroundColor = UIColor.red
            leftSecondView.backgroundColor = UIColor.red
        }
        */
        
        
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
    
    static func nib() -> UINib {
        return UINib.init(nibName: "TableViewCell", bundle: nil)
    }
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
