//
//  DetailCarView.swift
//  CarRentalApp
//
//  Created by omar thamri on 9/12/2023.
//

import SwiftUI

struct DetailCarView: View {
    var selectedCar: Car = Car(id: UUID().uuidString, carName: "MERCEDES-BENZ C-CLASS", rating: 5, brand: "Mercedes", pricePerDay: 40, description: "This 2023 mercedes benz c class is the perfect car to get around town or book for a weekend gateaway!", imagesNames: ["mercedes_c_0","mercedes_c_1","mercedes_c_2","mercedes_c_3","mercedes_c_4"], insurance: "Travelers",numberOfSeats: 5,numberOfDoors: 4,GasType: "Gas (Premium)")
    let heightTabView: CGFloat = UIScreen.main.bounds.height / 3
    @Environment(\.dismiss) var dismiss
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
                .overlay {
                    Button {
                        dismiss()
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .frame(width: 40, height: 40)
                                    .shadow(radius: 10, x:10,y:10)
                                Spacer()
                            }
                            Spacer()
                        }
                        .padding(.horizontal,10)
                        .padding(.vertical,40)
                        
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
                
                Divider()
                LocationView(title: "Pickup & Return", message: "San Francisco")
                Divider()
                CancellationView(title: "Cancellation policy", message: "Free cancellation")
                Divider()
                CarInfoView(title: "Distance included", message: selectedCar.maxDistance == nil ? "Unlimited" : "\(selectedCar.maxDistance ?? 0) km")
                Divider()
                InsuranceInfoView(title: "Insurance & Protection", message: selectedCar.insurance)
                Divider()
                CarBasicsView(title: "Car Basics", numberOfSeats: selectedCar.numberOfSeats, numberOfDoors: selectedCar.numberOfDoors, gasType: selectedCar.GasType)
                Divider()
                CarInfoView(title: "Description", message: selectedCar.description)
                
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

struct CarInfoView: View {
    var title: String
    var message: String
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            Text(message)
        }
        .padding(.horizontal)
    }
}

struct LocationView: View {
    var title: String
    var message: String
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            HStack(spacing: 10) {
                Image(systemName: "mappin.and.ellipse.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    Text(message)
            }
            
        }
        .padding(.horizontal)
    }
}

struct CancellationView: View {
    var title: String
    var message: String
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            HStack {
                Image(systemName: "hand.thumbsup")
                VStack(alignment: .leading) {
                    Text(message)
                    Text("Full refund before: ")
                        .font(.footnote)
                        .foregroundStyle(.gray) + 
                    Text(Date(),style: .date)
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
            }
            
        }
        .padding(.horizontal)
    }
}

struct InsuranceInfoView: View {
    var title: String
    var message: String
    @State private var showInsuranceSheet: Bool = false
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            HStack {
                Text("Insurance via "+message)
                Spacer()
                Button(action: {
                    showInsuranceSheet.toggle()
                }, label: {
                    Text("Read more")
                        .font(.headline)
                        .fontWeight(.bold)
                })
            }
        }
        .padding(.horizontal)
        .sheet(isPresented: $showInsuranceSheet) {
           MyInsuranceView()
        }
    }
}

struct CarBasicsView: View {
    var title: String
    var numberOfSeats: Int
    var numberOfDoors: Int
    var gasType: String
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    VStack {
                        Image(systemName: "carseat.left.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("\(numberOfSeats) seats")
                    }
                    VStack {
                        Image(systemName: "car.window.right")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("\(numberOfDoors) doors")
                    }
                    VStack {
                        Image(systemName: "fuelpump")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text(gasType)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
        }
        .padding(.horizontal)
    }
}
