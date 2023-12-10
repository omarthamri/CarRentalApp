//
//  Brand.swift
//  CarRentalApp
//
//  Created by omar thamri on 10/12/2023.
//

import Foundation

struct Brand: Identifiable,Hashable,Codable {
    
    let id: String
    let brandName: String
    let imageName: String
    var carIds: [String]
    
}
