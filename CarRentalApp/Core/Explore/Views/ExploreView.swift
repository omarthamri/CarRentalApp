//
//  ExploreView.swift
//  CarRentalApp
//
//  Created by omar thamri on 7/12/2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    private var widthSearchBar: CGFloat = UIScreen.main.bounds.width - 30
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                    VStack {
                        Spacer()
                            .frame(height: 130)
                        CustomSearchBar()
                        Spacer()
                            .frame(height: 80)
                        PopularBrandsView()
                        TopCarsView()
                    }
            }
            .navigationStackModifier()
        }
    }
}

#Preview {
    ExploreView()
}
