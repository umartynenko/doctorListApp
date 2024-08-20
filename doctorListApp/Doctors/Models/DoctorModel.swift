//
//  DoctorModel.swift
//  doctorListApp
//
//  Created by Юрий Мартыненко on 19.08.2024.
//

import Foundation


struct Record: Codable {
    let record: RecordData
}


struct RecordData: Codable {
    let data: UserData
}


struct UserData: Codable {
    let users: [User]
}


struct User: Identifiable, Codable {
    let id: String
    let first_name: String
    let patronymic: String
    let last_name: String
    let ratings_rating: Double
    let avatar: String?
    let work_expirience: [WorkEpirience]
    let text_chat_price: Int
    let video_chat_price: Int
    let home_price: Int
    let hospital_price: Int
    let is_favorite: Bool
    let education_type_label: EducationTypeLabel?
    let scientific_degree_label: String
    let specialization: [Specialization]
    let nearest_reception_time: Int?
    
    var totalExperience: Int {
        work_expirience.reduce(0) { sum, experience in
                let end_date = experience.end_date ?? Int(Date().timeIntervalSince1970)
                let start_date = experience.start_date ?? 0
                return sum + (end_date - start_date) / (365 * 24 * 60 * 60)
            }
        }
    var minPrice: Int {
        let price = [text_chat_price, video_chat_price, home_price, hospital_price]
        let filteredPrice = price.filter { $0 > 0}
        return filteredPrice.min() ?? 0
    }
    
    var allSpecialization: String {
        let specializationNames = specialization.map(\.self).map(\.name!).joined(separator: ", ")
        return specializationNames.isEmpty ? "Нет" : specializationNames
    }
}


struct WorkEpirience: Codable {
    let start_date: Int?
    let end_date: Int?
}


struct EducationTypeLabel: Codable {
    let name: String?
}


struct Specialization: Codable {
    let name: String?
}
