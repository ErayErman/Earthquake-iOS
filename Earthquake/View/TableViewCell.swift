//
//  TableViewCell.swift
//  Earthquake
//
//  Created by Eray Erman on 30.06.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var infoView: InfoView!
    static let identifier = "TableViewCell"
    func setupUI(model: EQDataModel) {
        infoView.setupUI(model: model)
        
    }
    
    static func nib() -> UINib {
        return UINib.init(nibName: "TableViewCell", bundle: nil)
    }
   
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
