//
//  ExploreViewModel.swift
//  CarRentalApp
//
//  Created by omar thamri on 10/12/2023.
//

import Foundation


class ExploreViewModel: ObservableObject {
    
    @Published var brands: [Brand] = [
                                      Brand(id: UUID().uuidString, brandName: "Mercedes",imageName: "mercedes", carIds: []),
                                      Brand(id: UUID().uuidString, brandName: "BMW",imageName: "bmw", carIds: []),
                                      Brand(id: UUID().uuidString, brandName: "Jaguar",imageName: "jaguar", carIds: []),
                                      Brand(id: UUID().uuidString, brandName: "Audi",imageName: "audi", carIds: [])
                                      ]
    
    
    
}
