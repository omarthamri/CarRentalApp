//
//  MainTabbarView.swift
//  CarRentalApp
//
//  Created by omar thamri on 7/12/2023.
//

import SwiftUI

struct MainTabbarView: View {
    @State private var selectedTab: Int = 0
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                            .environment(\.symbolVariants,selectedTab == 0 ? .fill : .none)
                        Text("Search")
                    }
                }
                .onAppear{
                    selectedTab = 0
                }
            Text("Favorites")
                .tabItem {
                    VStack {
                        Image(systemName: "heart")
                            .environment(\.symbolVariants,selectedTab == 1 ? .fill : .none)
                        Text("Favorites")
                    }
                }
                .onAppear{
                    selectedTab = 1
                }
            Text("Trips")
                .tabItem {
                    VStack {
                        Image(systemName: "road.lanes")
                            .environment(\.symbolVariants,selectedTab == 2 ? .fill : .none)
                        Text("Trips")
                    }
                }
                .onAppear{
                    selectedTab = 2
                }
            Text("Inbox")
                .tabItem {
                    VStack {
                        Image(systemName: "bubble")
                            .environment(\.symbolVariants,selectedTab == 3 ? .fill : .none)
                        Text("Inbox")
                    }
                }
                .onAppear{
                    selectedTab = 3
                }
            Text("More")
                .tabItem {
                    VStack {
                        Image(systemName: "ellipsis")
                            .environment(\.symbolVariants,selectedTab == 4 ? .fill : .none)
                        Text("More")
                    }
                }
                .onAppear{
                    selectedTab = 4
                }
        }
        .onAppear{
            UITabBar.appearance().backgroundColor = .white
        }
    }
}

#Preview {
    MainTabbarView()
}
