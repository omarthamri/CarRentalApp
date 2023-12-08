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
            ScrollView {
                ZStack {
                    LinearGradient(colors: [Color(.systemGray),.blue], startPoint: .top, endPoint: .center)
                        .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height / 2)
                    VStack {
                        Spacer()
                            .frame(height: 130)
                        CustomSearchBar(widthSearchBar: widthSearchBar)
                        Spacer()
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
