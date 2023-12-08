//
//  TripsView.swift
//  CarRentalApp
//
//  Created by omar thamri on 8/12/2023.
//

import SwiftUI

enum TabSelection {
    case booked
    case history
}

struct TripsView: View {
    var barWidth: CGFloat = (UIScreen.main.bounds.width / 2) - 20
    @State var tabSelection: TabSelection = .booked
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .ignoresSafeArea()
                VStack(spacing: 30) {
                    HStack {
                            Button(action: {
                                withAnimation(.spring) {
                                    tabSelection = .booked
                                }
                            }, label: {
                                VStack {
                                    Text("Booked")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(tabSelection == .booked ? .blue : Color(.darkGray))
                                        .frame(width: barWidth, alignment: .center)
                                    Rectangle()
                                        .frame(width: barWidth, height: 1)
                                        .foregroundStyle(tabSelection == .booked ? .blue : .clear)
                                }
                            })
                            
                            Button(action: {
                                withAnimation(.spring) {
                                    tabSelection = .history
                                }
                            }, label: {
                                VStack {
                                    Text("History")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(tabSelection == .history ? .blue : Color(.darkGray))
                                        .frame(width: barWidth, alignment: .center)
                                    Rectangle()
                                        .frame(width: barWidth, height: 1)
                                        .foregroundStyle(tabSelection == .history ? .blue : .clear)
                                }
                            })
                    }
                    switch tabSelection {
                    case .booked:
                        EmptyElementView(imageName: "car_img", title: "No trips")
                    case .history:
                        EmptyElementView(imageName: "car_img", title: "No previous trips")
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Trips")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

#Preview {
    TripsView()
}
