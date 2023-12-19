//
//  TripDateView.swift
//  CarRentalApp
//
//  Created by omar thamri on 19/12/2023.
//

import SwiftUI

struct TripDateView: View {
    var currentYear = Calendar.current.component(.year, from: Date())
    var currentMonth = Calendar.current.component(.month, from: Date())
    var currentDay = Calendar.current.component(.day, from: Date())
    var returnDay = Calendar.current.component(.day, from: Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date())
    @State private  var selectedDates: Set<DateComponents>
    @State private var isDatePickerPresented: Bool = false
    init() {
        self.selectedDates = [.init(timeZone: .gmt, year: Int(currentYear), month: Int(currentMonth), day: Int(currentDay), hour: 10),.init(timeZone: .gmt, year: 2023, month: 12, day: returnDay, hour: 10)]
    }
    func formattedDate(addedDays: Int) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE d MMM "
        return dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: addedDays, to: Date()) ?? Date())
        }
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text("Trip Dates")
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            HStack(spacing: 10) {
                Image(systemName: "calendar.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                VStack(alignment: .leading) {
                    Text("\(formattedDate(addedDays: 0)), 10:00")
                    Text("\(formattedDate(addedDays: 2)), 10:00")
                }
                Spacer()
                Button {
                    isDatePickerPresented.toggle()
                } label: {
                    Text("Change")
                        .font(.headline)
                        .fontWeight(.bold)
                }

            }
            
        }
        .padding(.horizontal)
        .popover(isPresented: $isDatePickerPresented, arrowEdge: .top) {
            let tomorrow = Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date()
            @State var start: Double = 10
            @State var end: Double = 10
            ScrollView {
                VStack(spacing: 30) {
                    Rectangle()
                        .frame(width: 60, height: 5)
                        .foregroundStyle(Color(.systemGray5))
                        .padding(.vertical)
                    HStack {
                        VStack {
                            Text(Date(),style: .date)
                            .fontWeight(.bold)
                            Text("10:00")
                        }
                        Spacer()
                        Image(systemName: "arrowshape.forward.fill")
                        Spacer()
                        VStack {
                            Text(tomorrow, style: .date)
                            .fontWeight(.bold)
                            Text("10:00")
                        }
                    }
                    .font(.footnote)
                    .padding(.horizontal)
                    Divider()
                        .padding(.bottom)
                    MultiDatePicker("Select Dates", selection: $selectedDates,in: Date()...)
                    .frame(height: 300)
                    .padding(.horizontal)
                    Divider()
                        .padding(.top)
                    HStack {
                        Text("Start: 10")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                        Slider(value: $start, in: 0...24)
                    }
                    .padding(.horizontal)
                    HStack(spacing: 15) {
                        Text("End: 10")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                        Slider(value: $start, in: 0...24)
                    }
                    .padding(.horizontal)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Save")
                            .foregroundStyle(.white)
                            .frame(width: UIScreen.main.bounds.width - 35, height: 45)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    .padding(.top)
                    Spacer()
                }
                .padding(.vertical)
            }
            .scrollIndicators(.hidden)
        }
    }
}
