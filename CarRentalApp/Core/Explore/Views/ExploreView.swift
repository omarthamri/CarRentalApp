//
//  ExploreView.swift
//  CarRentalApp
//
//  Created by omar thamri on 7/12/2023.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        ScrollView {
            VStack {
                LinearGradient(colors: [Color(.systemGray),.blue], startPoint: .top, endPoint: .center)
                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height / 2)
            }
        }
        .background(Color(.systemGray6))
        .ignoresSafeArea()
        
    }
}

#Preview {
    ExploreView()
}
