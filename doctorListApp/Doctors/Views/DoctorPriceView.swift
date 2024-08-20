//
//  DoctorPriceView.swift
//  doctorListApp
//
//  Created by Юрий Мартыненко on 20.08.2024.
//

import SwiftUI


struct DoctorPriceView: View {
    @State var user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if user.text_chat_price > 0 { DoctorPriceCardViewModel(serviceName: "Чат с врачем", price: user.text_chat_price) }
            if user.video_chat_price > 0 { DoctorPriceCardViewModel(serviceName: "Видеоконсультация", price: user.video_chat_price) }
            if user.home_price > 0 { DoctorPriceCardViewModel(serviceName: "Выезд на дом", price: user.home_price) }
            if user.hospital_price > 0 { DoctorPriceCardViewModel(serviceName: "Приём в клинике", price: user.hospital_price) }
        }
        .padding()
        .frame(maxWidth: .infinity,  maxHeight: .infinity, alignment: .topLeading)
        .background(.backgroundApp)
        .navigationTitle("Стоимость услуг")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    DoctorPriceView()
//}
