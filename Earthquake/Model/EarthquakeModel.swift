//
//  earthquakeModel.swift
//  Earthquake
//
//  Created by Eray Erman on 30.06.2021.
//

import Foundation

struct DataModel: Codable {
    let success: Bool?
    let data: [EQDataModel]?
}
// MARK: - EQDataModel
struct EQDataModel: Codable {
    let date: String?
    let latitude: Double?
    let longitude: Double?
    let depth: Double?
    let md: String?
    let ml: String?
    let mw: String?
    let place: String?
    let status: String?
    
}
