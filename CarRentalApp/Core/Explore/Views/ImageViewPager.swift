//
//  ImageViewPager.swift
//  CarRentalApp
//
//  Created by omar thamri on 19/12/2023.
//

import SwiftUI

struct ImageViewPager: View {
    @StateObject private var viewModel: ExploreViewModel
    @Environment(\.dismiss) var dismiss
    let heightTabView: CGFloat = UIScreen.main.bounds.height / 3
    @State private var isFavorite: Bool
    let index: Int
    init(viewModel: ExploreViewModel, index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
        self._isFavorite = State(initialValue: viewModel.cars[index].isFavorite)
    }
    var body: some View {
        TabView {
            ForEach(viewModel.cars[index].imagesNames,id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
            }
        }
        .overlay {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: { dismiss() }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(width: 40, height: 40)
                            .shadow(radius: 10, x:10,y:10)
                    })
                    Spacer()
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.white)
                        .frame(width: 40, height: 40)
                        .overlay {
                            Button {
                                isFavorite.toggle()
                            } label: {
                                Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    .foregroundStyle(.red)
                            }
                            
                        }
                }
                Spacer()
            }
            .padding(.horizontal,10)
            .padding(.vertical,40)

        }
        .tabViewStyle(.page)
        .frame(height: heightTabView)
    }
}

#Preview {
    ImageViewPager(viewModel: ExploreViewModel(), index: 0)
}
