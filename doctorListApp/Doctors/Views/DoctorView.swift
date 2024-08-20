//
//  DoctorView.swift
//  doctorListApp
//
//  Created by Юрий Мартыненко on 18.08.2024.
//

import SwiftUI


struct DoctorView: View {
    @State private var selectedSort: Sorted = .byPrice
    @State private var users: [User] = []
    @State private var searchText: String = ""
    @State private var showSearch: Bool = false // Make sure this is initialized
    @State private var convenientSortButton: Bool = false

    enum Sorted: String, CaseIterable, Identifiable {
        case byPrice = "По цене"
        case byExperience = "По стажу"
        case byRating = "По рейтингу"
        
        var id: Self { self }
    }
    
    // Фильтруем пользователей на основе введенного текста
    var filteredDoctors: [User] {
        if searchText.isEmpty || searchText == " " {
            return users
        }
        let searchLowercased = searchText.lowercased(with: Locale.current)
        return users.filter { user in
            let fullName = "\(user.first_name.lowercased()) \(user.patronymic.lowercased()) \(user.last_name.lowercased())"
            return fullName.contains(searchLowercased)
        }
    }

    var sortedUsers: [User] {
        let filtered = filteredDoctors
        
        switch selectedSort {
            case .byPrice:
                return filtered.sorted { convenientSortButton ? $0.minPrice < $1.minPrice : $0.minPrice > $1.minPrice }
            case .byExperience:
                return filtered.sorted { convenientSortButton ? $0.totalExperience < $1.totalExperience : $0.totalExperience > $1.totalExperience }
            case .byRating:
                return filtered.sorted { convenientSortButton ? $0.ratings_rating < $1.ratings_rating : $0.ratings_rating > $1.ratings_rating }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    ForEach(Sorted.allCases) { sort in
                        Button {
                                selectedSort = sort
                                convenientSortButton.toggle()
                        } label: {
                            HStack(alignment: .center, spacing: 6) {
                                Text(sort.rawValue)
                                    .foregroundColor(selectedSort == sort ? .white : .darkGrayApp)
                                    .animation(.easeInOut, value: selectedSort)
                                Image(systemName: convenientSortButton ? "arrow.down" : "arrow.up")
                                    .foregroundColor(selectedSort == sort ? .white : .clear)
                                    .animation(.easeInOut, value: convenientSortButton)
                            }
                            .font(.system(size: 14))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 7)
                            .background(selectedSort == sort ? .pinkApp : Color.clear)
                        }
                    }
                }
                .frame(maxHeight: 32, alignment: .center)
                .background(.white)
                .cornerRadius(8)
                .padding(.bottom, 24)
                
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(sortedUsers) { user in
                            NavigationLink(destination: DoctorDetailView(user: user)) {
                                DoctorCardViewModel(ratings_rating: user.ratings_rating, first_name: user.first_name, patronymic: user.patronymic, last_name: user.last_name, avatar: user.avatar ?? "person.circle", work_experience: user.totalExperience, minPrice: user.minPrice, is_favorite: user.is_favorite, user: user)
                                    .padding(.bottom, 16)
                                    .padding(.horizontal, 16)
                            }
                            .buttonStyle(PlainButtonStyle()) 
                        }
                        .background(.backgroundApp)
                    }
                }
                .background(.backgroundApp)
                .onAppear {
                    let loadedUsers = GetDoctors()
                    self.users = loadedUsers.getDoctors()!
                }
                .searchable(text: $searchText, isPresented: $showSearch, prompt: "Поиск")
            }
            .background(.backgroundApp)
            .navigationTitle("Педиатры")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
        }
    }
}
