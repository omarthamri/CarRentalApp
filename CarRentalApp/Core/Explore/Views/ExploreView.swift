//
//  ExploreView.swift
//  CarRentalApp
//
//  Created by omar thamri on 7/12/2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    @StateObject var viewModel = ExploreViewModel()
    private var widthSearchBar: CGFloat = UIScreen.main.bounds.width - 30
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ZStack {
                    GradientColorBackground()
                    VStack {
                        Spacer()
                            .frame(height: 150)
                        CustomSearchBar()
                        Spacer()
                            .frame(height: 60)
                        PopularBrandsView(viewModel: viewModel)
                        TopCarsView()
                    }
                }
                    
                    
            }
            .navigationStackModifier()
        }
    }
}

#Preview {
    ExploreView()
}

struct GradientColorBackground: View {
    var body: some View {
        VStack {
            LinearGradient(colors: [Color(.systemGray),.blue], startPoint: .top, endPoint: .center)
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height / 2)
            Spacer()
        }
    }
}
