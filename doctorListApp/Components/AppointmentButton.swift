//
//  AppointmentButton.swift
//  doctorListApp
//
//  Created by Юрий Мартыненко on 21.08.2024.
//

import SwiftUI

struct AppointmentButton<Destination: View>: View {
    let nearestReceptionTime: Int?
    let destination: Destination
    
    var body: some View {
            if nearestReceptionTime != nil {
                NavigationLink(destination: destination) {
                    VStack {
                        Text("Записаться")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 47)
                            .background(.pinkApp)
                            .cornerRadius(8)
                    }
                }
            } else {
                VStack {
                    Text("Нет свободного расписания")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 47)
                        .background(.buttoGraqApp)
                        .cornerRadius(8)
                }
                .disabled(true)
            }
        }
    }

