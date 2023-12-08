//
//  CustomCarView.swift
//  CarRentalApp
//
//  Created by omar thamri on 8/12/2023.
//

import SwiftUI

struct CustomCarView: View {
    var index: Int
    @State var isFavorite: Bool
    var body: some View {
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
                    Button(action: {
                        isFavorite.toggle()
                    }, label: {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundStyle(.red)
                    })
                    
                }
                .padding()
        }
    }
}

#Preview {
    CustomCarView(index: 0, isFavorite: false)
}
