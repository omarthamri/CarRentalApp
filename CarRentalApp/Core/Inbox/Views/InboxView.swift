//
//  InboxView.swift
//  CarRentalApp
//
//  Created by omar thamri on 9/12/2023.
//

import SwiftUI

enum InboxTabSelection {
    case Messages
    case Notifications
}

struct InboxView: View {
    var barWidth: CGFloat = (UIScreen.main.bounds.width / 2) - 20
    @State var tabSelection: InboxTabSelection = .Messages
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .ignoresSafeArea()
                VStack(spacing: 30) {
                    HStack {
                        Button(action: {
                            withAnimation(.spring) {
                                tabSelection = .Messages
                            }
                        }, label: {
                            VStack {
                                Text("Messages")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(tabSelection == .Messages ? .blue : Color(.darkGray))
                                    .frame(width: barWidth, alignment: .center)
                                Rectangle()
                                    .frame(width: barWidth, height: 1)
                                    .foregroundStyle(tabSelection == .Messages ? .blue : .clear)
                            }
                        })
                        
                        Button(action: {
                            withAnimation(.spring) {
                                tabSelection = .Notifications
                            }
                        }, label: {
                            VStack {
                                Text("Notifications")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(tabSelection == .Notifications ? .blue : Color(.darkGray))
                                    .frame(width: barWidth, alignment: .center)
                                Rectangle()
                                    .frame(width: barWidth, height: 1)
                                    .foregroundStyle(tabSelection == .Notifications ? .blue : .clear)
                            }
                        })
                    }
                    switch tabSelection {
                    case .Messages:
                        EmptyElementView(imageName: "message", title: "No messages yet")
                    case .Notifications:
                        NotificationsView()
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Inbox")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    InboxView()
}
