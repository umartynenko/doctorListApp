//
//  DoctorDetailView.swift
//  doctorListApp
//
//  Created by Юрий Мартыненко on 20.08.2024.
//

import SwiftUI


struct DoctorDetailView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                AsyncImage(url: URL(string: user.avatar ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(.circle)
                } placeholder: {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(.circle)
                        .foregroundColor(.darkGrayApp)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(user.last_name)
                        .font(.system(size: 16, weight: .bold))
                    Text("\(user.first_name) \(user.patronymic)")
                        .font(.system(size: 16, weight: .bold))
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    Image(systemName: "clock")
                        .foregroundColor(.darkGrayApp)
                    Text("Опыт работы: \(user.totalExperience) лет")
                        .font(.caption)
                        .foregroundColor(.darkGrayApp)
                }
                
                HStack{
                    Image(systemName: "cross.case")
                        .foregroundColor(.darkGrayApp)
                    Text(user.scientific_degree_label)
                        .font(.caption)
                        .foregroundColor(.darkGrayApp)
                }
                
                if (user.education_type_label?.name) != nil {
                    HStack{
                        Image(systemName: "graduationcap")
                            .foregroundColor(.darkGrayApp)
                        Text(user.education_type_label?.name ?? "")
                            .font(.caption)
                            .foregroundColor(.darkGrayApp)
                    }
                }
                
                HStack{
                    Image(.mappinApp)
                        .resizable()
                        .frame(width: 13, height: 20)
                        .foregroundColor(.darkGrayApp)
                        .padding(.horizontal, 6)
                    Text("Детская клиника “РебёнОК")
                        .font(.caption)
                        .foregroundColor(.darkGrayApp)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text("Стоимость услуг")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
                Text("от \(user.minPrice) ₽")
                    .font(.system(size: 16, weight: .bold))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 18)
            .background(.white)
            .cornerRadius(8)
            
            Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                .font(.system(size: 14))
                .lineSpacing(8)
            
            Spacer()
            
            AppointmentButton(nearestReceptionTime: user.nearest_reception_time, destination: DoctorPriceView(user: user))
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
        .padding(.bottom, 10)
        .frame(maxWidth: .infinity,  maxHeight: .infinity, alignment: .topLeading)
        .background(.backgroundApp)
        .navigationTitle("Педиатр")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    DoctorDetailView()
//}
