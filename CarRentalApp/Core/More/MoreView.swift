//
//  MoreView.swift
//  CarRentalApp
//
//  Created by omar thamri on 9/12/2023.
//

import SwiftUI

struct MoreView: View {
    var parametersOptions: [(String,Image)] = [("Account",Image(systemName: "person")),("How CarRentalApp works",Image(systemName: "key.horizontal")),("Contact Support",Image(systemName: "person.wave.2")),("Legal",Image(systemName: "newspaper")),("Open source license",Image(systemName: "newspaper"))]
    @State private var showAlert: Bool = false
    @State private var displayEditProfileView: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading,spacing: 30) {
                    Button(action: {
                        displayEditProfileView.toggle()
                    }, label: {
                        HeaderView()
                    })
                    
                        VStack(spacing: 60) {
                            
                                ForEach(parametersOptions, id: \.0) { option in
                                    HStack {
                                        option.1
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        Text(option.0)
                                    Spacer()
                                }
                                }
                            }
                        .padding(.horizontal)
                        Divider()
                        .padding(.vertical)
                    VStack(alignment: .leading,spacing: 30) {
                        Button(action: {
                            showAlert.toggle()
                        }, label: {
                            Text("Logout")
                                .foregroundStyle(.black)
                        })
                        Text("version 1.0")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal)
                        }
                    .padding(.vertical,40)
            }
            .alert("Are you sure you want to logut?", isPresented: $showAlert, actions: {
                Button("Logout") { }
                Button("Cancel", role: .cancel) {}
            })
            .ignoresSafeArea()
            .background(Color(.systemGray6))
            .fullScreenCover(isPresented: $displayEditProfileView, content: {
                EditProfileView()
            })
        }
        }
    }

#Preview {
    MoreView()
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                Image("michael_scott")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundStyle(.gray)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text("Wanda Maximov")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("View and edit profile")
                        .foregroundStyle(.blue)
                }
                Spacer()
            }
            .padding()
            Divider()
        }
    }
}
