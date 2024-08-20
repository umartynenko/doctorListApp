//
//  GetDoctors.swift
//  doctorListApp
//
//  Created by Юрий Мартыненко on 19.08.2024.
//

import Foundation


class GetDoctors {
    private func loadUsersFromJSON() -> [User]? {
        guard let url = Bundle.main.url(forResource: "655b754e0574da7622c94aa4", withExtension: "json") else {
            print("Failed to locate JSON file in bundle.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let record = try decoder.decode(Record.self, from: data)
            // Извлекаем всех пользователей из записей
            let users = record.record.data.users
            return users
        } catch {
            print("Failed to load or decode JSON: \(error.localizedDescription)")
            return nil
        }
    }
    
    func getDoctors() -> [User]? {
        return loadUsersFromJSON()
    }    
}
