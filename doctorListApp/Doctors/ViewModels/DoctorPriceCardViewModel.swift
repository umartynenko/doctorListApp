//
//  DoctorPriceCardViewModel.swift
//  doctorListApp
//
//  Created by Юрий Мартыненко on 20.08.2024.
//

import SwiftUI


struct DoctorPriceCardViewModel: View {
    let serviceName: String
    let price: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(serviceName)
                .font(.system(size: 16, weight: .bold))
            
            HStack {
                Text("30 мин")
                    .font(.system(size: 16))
                Spacer()
                Text("\(price) ₽")
                    .font(.system(size: 16, weight: .bold))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 18)
            .background(.white)
            .cornerRadius(8)
        }
        .padding(.bottom, 24)
        .background(.backgroundApp)
    }
}

//#Preview {
//    DoctorPriceCardViewModel()
//}
