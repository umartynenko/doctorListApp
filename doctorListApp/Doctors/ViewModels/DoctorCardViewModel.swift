//
//  DoctorCardViewModel.swift
//  doctorListApp
//
//  Created by Юрий Мартыненко on 19.08.2024.
//

import SwiftUI


struct DoctorCardViewModel: View {
    @State var ratings_rating: Double
    @State var first_name: String
    @State var patronymic: String
    @State var last_name: String
    @State var avatar: String
    @State var work_experience: Int
    @State var minPrice: Int
    @State var is_favorite: Bool
    @State var user: User
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 16) {
                if !avatar.isEmpty {
                    AsyncImage(url: URL(string: avatar)) { image in
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
                } else {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(.circle)
                        .foregroundColor(.darkGrayApp)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(last_name)
                        .font(.system(size: 16, weight: .bold))
                    Text("\(first_name) \(patronymic)")
                        .font(.system(size: 16, weight: .bold))
                    
                    HStack {
                        ForEach(1..<6) { index in
                            ZStack {
                                // Пустая звезда
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.darkGrayApp)
                                
                                // Закрашенная звезда
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.pinkApp)
                                    .mask {
                                        Rectangle()
                                            .size(width: CGFloat(max(min(ratings_rating - Double(index - 1), 1), 0)) * 12, height: 12)
                                    }
                            }
                            .onTapGesture {
                                ratings_rating = Double(index)
                            }
                        }
                    }
                    
                    Text("\(user.allSpecialization)・стаж \(formationWordYear(work_experience))")
                        .font(.caption)
                        .foregroundColor(.darkGrayApp)
                    
                    if minPrice != 0 {
                        Text("oт \(minPrice) ₽")
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                
                Spacer()
                
                Button {
                    is_favorite.toggle()
                } label: {
                    Image(systemName: is_favorite ? "heart.fill" : "heart")
                        .foregroundColor(is_favorite ? .pinkApp : .silverApp)
                }
                
            }
            AppointmentButton(nearestReceptionTime: user.nearest_reception_time, destination: DoctorPriceView(user: user))
        }
        .padding()
        .background(.white)
        .cornerRadius(8)
    }
}

//#Preview {
//    var first_name: String
//    var patronymic: String
//    var last_name: String
//    var avatar: String
//    var start_date: Int
//    
//    DoctorCardViewModel(ratings_rating: 2.5, first_name: "Bob", patronymic: "Ivanovich", last_name: "Ivanov", avatar: "https://sun9-15.userapi.com/c8577FkvjgF07RHmvw/yc41QvZj080.jpg", start_date: 2019)
//}
