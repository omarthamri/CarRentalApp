//
//  DetailCarView.swift
//  CarRentalApp
//
//  Created by omar thamri on 9/12/2023.
//

import SwiftUI

struct DetailCarView: View {
    let index: Int
    @StateObject private var viewModel: ExploreViewModel
    
    init(viewModel: ExploreViewModel,index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
    }
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading,spacing: 15) {
                ImageViewPager(viewModel: viewModel, index: index)
                VStack(alignment: .leading,spacing: 15) {
                    Text(viewModel.cars[index].carName)
                        .font(.headline)
                        .fontWeight(.bold)
                    HStack(spacing: 2) {
                        Text(String(format: "%.1f", viewModel.cars[index].rating))
                        
                        Image(systemName: "star.fill")
                            .foregroundStyle(.orange)
                    }
                }
                .padding(.horizontal)
                Divider()
                TripDateView()
                Divider()
                LocationView(title: "Pickup & Return", message: "San Francisco")
                Divider()
                CancellationView(title: "Cancellation policy", message: "Free cancellation")
                Divider()
                CarInfoView(title: "Distance included", message: viewModel.cars[index].maxDistance == nil ? "Unlimited" : "\(viewModel.cars[index].maxDistance ?? 0) km")
                Divider()
                InsuranceInfoView(title: "Insurance & Protection", message: viewModel.cars[index].insurance)
                Divider()
                CarBasicsView(title: "Car Basics", numberOfSeats: viewModel.cars[index].numberOfSeats, numberOfDoors: viewModel.cars[index].numberOfDoors, gasType: viewModel.cars[index].GasType)
                Divider()
                CarInfoView(title: "Description", message: viewModel.cars[index].description)
                Divider()
                HostView(title: "Hosted by", message:  viewModel.cars[index].hostName, imageName: viewModel.cars[index].hostImageName, joinDate:viewModel.cars[index].hostJoinDate)
                Spacer()
                    .frame(height: 120)
                
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
                            Text("\(viewModel.cars[index].pricePerDay)$ per day")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("\(viewModel.cars[index].pricePerDay * 3)$ est. total")
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
    DetailCarView(viewModel: ExploreViewModel(), index: 0)
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

struct HostView: View {
    var title: String
    var message: String
    var imageName: String
    var joinDate: String
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            HStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(message)
                        .fontWeight(.bold)
                    Text("Joined \(joinDate)")
                        .font(.subheadline)
                }
            }
            
        }
        .padding(.horizontal)
    }
}
