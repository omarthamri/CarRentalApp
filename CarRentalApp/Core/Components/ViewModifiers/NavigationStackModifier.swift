//
//  NavigationStackModifier.swift
//  CarRentalApp
//
//  Created by omar thamri on 7/12/2023.
//

import SwiftUI

struct NavigationStackModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background{
                ZStack {
                    Color(.systemGray6)
                    VStack {
                        LinearGradient(colors: [Color(.systemGray),.blue], startPoint: .top, endPoint: .center)
                            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height / 2)
                        Spacer()
                    }
                }
            }
            .ignoresSafeArea()
            .navigationTitle("Find Cars")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Circle()
                        .fill(.white.opacity(0.1))
                        .frame(width:45,height: 45)
                        .overlay {
                            Image(systemName: "bell.badge")
                                .foregroundStyle(.white)
                        }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image("michael_scott")
                        .resizable()
                        .frame(width:45,height: 45)
                        .scaledToFill()
                        .clipShape(Circle())
                }
            }
        
    }
}

extension View {
    func navigationStackModifier() -> some View {
        modifier(NavigationStackModifier())
    }
}
