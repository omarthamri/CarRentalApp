//
//  CustomSearchView.swift
//  CarRentalApp
//
//  Created by omar thamri on 8/12/2023.
//

import SwiftUI

struct CustomSearchBar: View {
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                    .foregroundStyle(.white)
                Text("Search a car...")
                    .font(.footnote)
                    .foregroundStyle(.white)
                Spacer()
                
                
            }
            .frame(height: 60)
            .overlay {
                Capsule()
                    .stroke(lineWidth: 0.5)
                    .foregroundStyle(Color(.systemGray4))
                    .shadow(color: .black.opacity(0.4), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal)
        })
        
    }
}

#Preview {
    CustomSearchBar()
}
