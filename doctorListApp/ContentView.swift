//
//  ContentView.swift
//  doctorListApp
//
//  Created by Юрий Мартыненко on 18.08.2024.
//

import SwiftUI

struct ContentView: View {
    enum Sorted: String, CaseIterable, Identifiable {
        case byPrice = "По цене"
        case byExperience = "По стажу"
        case byRating = "По рейтингу"
        
        var id: Self { self }
    }
    
    @State private var selectedFlavor: Sorted = .byPrice
    
    var body: some View {
            VStack {
                TabView {
                    DoctorView()
                        .tag("doctorsChose")
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Главная")
                                .font(.system(size: 12))
                                .foregroundStyle(.darkGrayApp)
                        }
                    Text("Приемы")
                        .tag("doctorsChose")
                        .tabItem {
                            Image(systemName: "wallet.pass.fill")
                            Text("Приемы")
                                .font(.system(size: 12))
                                .foregroundStyle(.darkGrayApp)
                        }
                    Text("Чат")
                        .tag("doctorsChose")
                        .tabItem {
                            Image(systemName: "message.fill")
                            Text("Чат")
                                .font(.system(size: 12))
                                .foregroundStyle(.darkGrayApp)
                        }
                        .badge(3)
                    Text("Профиль")
                        .tag("doctorsChose")
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Профиль")
                                .font(.system(size: 12))
                                .foregroundStyle(.darkGrayApp)
                        }
                }
                .accentColor(.pinkApp)
            }
            .frame(maxWidth: .infinity,  maxHeight: .infinity)
            .background(.backgroundApp)
        }
}

#Preview {
    ContentView()
}
