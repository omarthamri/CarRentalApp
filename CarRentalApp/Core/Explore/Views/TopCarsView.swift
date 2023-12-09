//
//  TopCarsView.swift
//  CarRentalApp
//
//  Created by omar thamri on 8/12/2023.
//

import SwiftUI

struct TopCarsView: View {
    @State private var isFavorite: [Bool] = [false,false,false,false,false]
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text("Top Cars 🔥")
                .font(.headline)
                .fontWeight(.semibold)
            ForEach (0..<5) { index in
                NavigationLink {
                    DetailCarView()
                } label: {
                    CustomCarView(index: index, isFavorite: isFavorite[index])
                }

                
            }
            
        }
        .padding()
    }
}

#Preview {
    TopCarsView()
}
