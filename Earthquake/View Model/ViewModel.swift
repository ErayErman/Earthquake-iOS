//
//  viewModel.swift
//  Earthquake
//
//  Created by Eray Erman on 1.07.2021.
//

import Foundation
import Alamofire

class ViewModel {
    
    var data: [EQDataModel] = []
    var updateUI: (() -> Void) = {}
    var urlString: String = "https://apps.furkansandal.com/st/intern"

    func getData(){
        
        AF.request(urlString).responseJSON { [weak self] response in
            guard let self = self else { return }
            let dataModel: DataModel = try! JSONDecoder().decode(DataModel.self, from: response.data!)
            self.data = dataModel.data!
            self.updateUI()
            
        }
    }
    
}




