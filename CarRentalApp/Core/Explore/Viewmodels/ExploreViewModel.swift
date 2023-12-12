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
    
    @Published var cars: [Car] = [
        .init(id: UUID().uuidString, carName: "MERCEDES-BENZ C-CLASS", rating: 4.9, brand: "Mercedes", pricePerDay: 40, description: "This 2023 Mercedes is the perfect car to get around town or book for a weekend getaway! \n It's easy to park, fun to drive and great on gas!", mainImageName: "merecedesC", imagesNames: ["mercedes_c_0","mercedes_c_1","mercedes_c_2","mercedes_c_3","mercedes_c_4"], insurance: "", numberOfSeats: 5, numberOfDoors: 4, GasType: "", hostName: "Dwight Automotive", hostImageName: "dwight", hostJoinDate: "20 Nov 2018",isFavorite: false),
        .init(id: UUID().uuidString, carName: "BMW X1", rating: 4.8, brand: "BMW", pricePerDay: 36, description: "This 2021 BMW is the perfect car to get around town or book for a weekend getaway! \n It's easy to park, fun to drive and great on gas!", mainImageName: "bmwx1", imagesNames: ["bmwx1_1","bmwx1_2","bmwx1_3"], insurance: "", numberOfSeats: 5, numberOfDoors: 4, GasType: "", hostName: "Dwight Automotive", hostImageName: "dwight", hostJoinDate: "20 Nov 2018",isFavorite: true)
    ]
    
    
    
}
