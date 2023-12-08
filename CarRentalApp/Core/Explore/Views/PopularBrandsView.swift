//
//  PopularBrandsView.swift
//  CarRentalApp
//
//  Created by omar thamri on 8/12/2023.
//

import SwiftUI

struct PopularBrandsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Popular Brands")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("See All")
                        .font(.footnote)
                        .fontWeight(.semibold)
                })
                
            }
            .foregroundStyle(.white)
            .padding()
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<5) { _ in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                            .frame(width: 150, height: 200)
                            .overlay {
                                VStack {
                                    Image("mercedes")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                    Text("Mercedes")
                                    Text("+5")
                                        .font(.footnote)
                                        .foregroundStyle(Color(.systemBlue))
                                }
                            }
                    }
                    
                }
            }
            .padding(.leading)
            
        }
    }
}

#Preview {
    PopularBrandsView()
}
