//
//  EditProfileView.swift
//  CarRentalApp
//
//  Created by omar thamri on 11/12/2023.
//

import SwiftUI

struct EditProfileView: View {
    @State private var about: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
                VStack(alignment: .leading,spacing: 20) {
                    Spacer().frame(height: 40)
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "multiply")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.black)
                            .padding(.bottom)
                    })
                    Text("Profile Photo")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Please a profile photo that clearly shows your face. It'll help hosts and guests recognizing you at the beginning of a trip.")
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Change profile photo")
                            .foregroundStyle(.black)
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.black,lineWidth: 1)
                            }
                    })
                    Text("About")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Tell hosts and guests about yourself and why you are a responsible, trustworthy person. \n Share your favorite travel experiences, your hobbies, your dream car, or your driving experience. Feel free to include links to your linkedin, twitter or facebook profiles so they get to know you even better.")
                    Text("About")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    TextField("Tell people about yourself", text: $about)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Lives")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    TextField("London, UK / Paris, France", text: $about)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Works")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    TextField("Ford / Fiat / Ferrari", text: $about)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("School")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    TextField("NYU / SF State", text: $about)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Languages")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    TextField("English,French", text: $about)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Spacer()
                        .frame(height: 120)
                }
                .padding()
            }
        .scrollIndicators(.hidden)
        .ignoresSafeArea()
        .background(Color(.systemGray6))
        .overlay {
            VStack {
                Spacer()
                ZStack {
                    Color.white
                        .frame(width: UIScreen.main.bounds.width, height: 120)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Save")
                            .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }
            }
            .ignoresSafeArea()
           
        }
    }
}

#Preview {
    EditProfileView()
}
