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
    let heightTabView: CGFloat = UIScreen.main.bounds.height / 3
    @Environment(\.dismiss) var dismiss
    @State private var isFavorite: Bool
    
    init(viewModel: ExploreViewModel,index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
        self._isFavorite = State(initialValue: viewModel.cars[index].isFavorite)
    }
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading,spacing: 15) {
                TabView {
                    ForEach(viewModel.cars[index].imagesNames,id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                    }
                }
                .overlay {
                    VStack(alignment: .leading) {
                        HStack {
                            Button(action: { dismiss() }, label: {
                                Image(systemName: "chevron.left")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .frame(width: 40, height: 40)
                                    .shadow(radius: 10, x:10,y:10)
                            })
                            Spacer()
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                                .frame(width: 40, height: 40)
                                .overlay {
                                    Button {
                                        isFavorite.toggle()
                                    } label: {
                                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                                            .foregroundStyle(.red)
                                    }
                                    
                                }
                        }
                        Spacer()
                    }
                    .padding(.horizontal,10)
                    .padding(.vertical,40)

                }
                .tabViewStyle(.page)
                .frame(height: heightTabView)
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
                TripDateView(title: "Trip Dates", pickupDate: "Tuesday 12 Dec, 10:00",returnDate: "Thursday 14 Dec, 10:00")
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

struct TripDateView: View {
    var title: String
    var pickupDate: String
    var returnDate: String
    @State private var selectedDates: Set<DateComponents> = [.init(timeZone: .gmt, year: 2023, month: 12, day: 12, hour: 10),.init(timeZone: .gmt, year: 2023, month: 12, day: 14, hour: 10)]
    @State private var isDatePickerPresented: Bool = false
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            HStack(spacing: 10) {
                Image(systemName: "calendar.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                VStack(alignment: .leading) {
                    Text(pickupDate)
                    Text(returnDate)
                }
                Spacer()
                Button {
                    isDatePickerPresented.toggle()
                } label: {
                    Text("Change")
                        .font(.headline)
                        .fontWeight(.bold)
                }

            }
            
        }
        .padding(.horizontal)
        .popover(isPresented: $isDatePickerPresented, arrowEdge: .top) {
            let tomorrow = Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date()
            @State var start: Double = 10
            @State var end: Double = 10
            ScrollView {
                VStack(spacing: 30) {
                    Rectangle()
                        .frame(width: 60, height: 5)
                        .foregroundStyle(Color(.systemGray5))
                        .padding(.vertical)
                    HStack {
                        VStack {
                            Text(Date(),style: .date)
                            .fontWeight(.bold)
                            Text("10:00")
                        }
                        Spacer()
                        Image(systemName: "arrowshape.forward.fill")
                        Spacer()
                        VStack {
                            Text(tomorrow, style: .date)
                            .fontWeight(.bold)
                            Text("10:00")
                        }
                    }
                    .font(.footnote)
                    .padding(.horizontal)
                    Divider()
                        .padding(.bottom)
                    MultiDatePicker("Select Dates", selection: $selectedDates,in: Date()...)
                    .frame(height: 300)
                    .padding(.horizontal)
                    Divider()
                        .padding(.top)
                    HStack {
                        Text("Start: 10")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                        Slider(value: $start, in: 0...24)
                    }
                    .padding(.horizontal)
                    HStack(spacing: 15) {
                        Text("End: 10")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                        Slider(value: $start, in: 0...24)
                    }
                    .padding(.horizontal)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Save")
                            .foregroundStyle(.white)
                            .frame(width: UIScreen.main.bounds.width - 35, height: 45)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    .padding(.top)
                    Spacer()
                }
                .padding(.vertical)
            }
            .scrollIndicators(.hidden)
        }
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
