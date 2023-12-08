//
//  TopCarsView.swift
//  CarRentalApp
//
//  Created by omar thamri on 8/12/2023.
//

import SwiftUI

struct TopCarsView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text("Top Cars 🔥")
                .font(.headline)
                .fontWeight(.semibold)
            ForEach (0..<5) { _ in
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(height: 120)
                    .overlay {
                        HStack(spacing: 10) {
                            Image("merecedesC")
                                .resizable()
                                .frame(width: 80,height: 50)
                                .scaledToFit()
                            VStack(alignment: .leading, spacing: 12) {
                                Text("MERCEDES-BENZ C-CLASS")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                HStack {
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(.orange)
                                    Text("5.0")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                }
                                Text("By Dwight automotive")
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                            }
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "heart")
                                    .foregroundStyle(.red)
                            })
                            
                        }
                        .padding()
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    TopCarsView()
}
