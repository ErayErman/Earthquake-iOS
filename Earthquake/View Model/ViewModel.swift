//
//  viewModel.swift
//  Earthquake
//
//  Created by Eray Erman on 1.07.2021.
//

import Foundation
import Alamofire
enum ServiceURLTypes: String {
    case kandilli = "https://apps.furkansandal.com/st/intern"
}
class ViewModel {
    
    var data: [EQDataModel] = []
    var updateUI: (() -> Void) = {}
    var urlString: ServiceURLTypes = .kandilli {
        didSet{
            getData()
        }
    }

    func getData(){
        
        AF.request(urlString.rawValue).responseJSON { [weak self] response in
            guard let self = self else { return }
            let dataModel: DataModel = try! JSONDecoder().decode(DataModel.self, from: response.data!)
            self.data = dataModel.data!
            self.updateUI()
            
        }
    }
    func setServiceType(type: Int){
        switch type {
        case 0:
            urlString = .kandilli
        case 1:
            urlString = .kandilli
        default:
            break
        }
    }
}




