//
//  MyInsuranceView.swift
//  CarRentalApp
//
//  Created by omar thamri on 10/12/2023.
//

import SwiftUI

struct MyInsuranceView: View {
    var body: some View {
        VStack(spacing: 30) {
            Rectangle()
                .frame(width: 60, height: 5)
                .foregroundStyle(Color(.systemGray5))
            Image(systemName: "questionmark.circle")
                .resizable()
                .frame(width: 35, height: 35)
            Text("All CarRentalAPP protection plans include a third-party libality in surance policy issued to CarRentalAPP. The policy provides secondary coverage to ensure that any CarRentalAPP driver will be insured to the state minimum limits required for third-party liability, unless primary coverage is explicitly required by an applicable state statute. Liabality coverage is devending on the plan chosen. \n \n Protection plan also come with 24/7 customer support and access to roadside service, subject to additional terms,conditions and costs.")
                .font(.subheadline)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    MyInsuranceView()
}
