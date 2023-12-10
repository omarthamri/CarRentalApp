//
//  PopularBrandsView.swift
//  CarRentalApp
//
//  Created by omar thamri on 8/12/2023.
//

import SwiftUI

struct PopularBrandsView: View {
    @StateObject var viewModel: ExploreViewModel
    
    init(viewModel: ExploreViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
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
                    ForEach(viewModel.brands) { brand in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                            .frame(width: 150, height: 200)
                            .overlay {
                                VStack {
                                    Image(brand.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                    Text(brand.brandName)
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
    PopularBrandsView(viewModel: ExploreViewModel())
}
