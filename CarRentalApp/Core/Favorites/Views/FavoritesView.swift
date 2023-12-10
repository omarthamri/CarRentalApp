//
//  FavoritesView.swift
//  CarRentalApp
//
//  Created by omar thamri on 8/12/2023.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(0..<5) { index in
                        NavigationLink {
                            DetailCarView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            CustomCarView(index: index, isFavorite: true)
                        }
                        
                        
                    }
                }
                .padding()
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemGray6))
        }
    }
}

#Preview {
    FavoritesView()
}
