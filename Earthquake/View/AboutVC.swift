//
//  AboutVC.swift
//  Earthquake
//
//  Created by Eray Erman on 29.07.2021.
//

import UIKit

class AboutVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: "")
        imageView.image = #imageLiteral(resourceName: "Softtech-Logo_standart-2")
    }

}
