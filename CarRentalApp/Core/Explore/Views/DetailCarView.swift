//
//  DetailCarView.swift
//  CarRentalApp
//
//  Created by omar thamri on 9/12/2023.
//

import SwiftUI

struct DetailCarView: View {
    var selectedCar: Car = Car(id: UUID().uuidString, carName: "MERCEDES-BENZ C-CLASS", rating: 5, brand: "Mercedes", pricePerDay: 40, description: "This 2023 mercedes benz c class is the perfect car to get around town or book for a weekend gateaway!", imagesNames: ["mercedes_c_0","mercedes_c_1","mercedes_c_2","mercedes_c_3","mercedes_c_4"])
    let heightTabView: CGFloat = UIScreen.main.bounds.height / 3
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading,spacing: 15) {
                TabView {
                    ForEach(selectedCar.imagesNames,id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                    }
                }
                .tabViewStyle(.page)
                .frame(height: heightTabView)
                VStack(alignment: .leading,spacing: 15) {
                    Text(selectedCar.carName)
                        .font(.headline)
                        .fontWeight(.bold)
                    HStack(spacing: 2) {
                        Text("\(selectedCar.rating)")
                        Image(systemName: "star.fill")
                            .foregroundStyle(.orange)
                    }
                }
                .padding(.horizontal)
                
            }
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea()
        .background(Color(.systemGray6))
        .toolbar(.hidden, for: .tabBar)
        .overlay {
            VStack {
                Spacer()
                ZStack {
                    Color.white
                        .frame(width: UIScreen.main.bounds.width, height: 120)
                    HStack {
                        VStack {
                            Text("\(selectedCar.pricePerDay)$ per day")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("\(selectedCar.pricePerDay * 3)$ est. total")
                                .font(.subheadline)
                                .underline()
                        }
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Continue")
                                .foregroundStyle(.white)
                                .frame(width: 120, height: 35)
                                .background(.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        })
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical)
                }
                
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    DetailCarView()
}
