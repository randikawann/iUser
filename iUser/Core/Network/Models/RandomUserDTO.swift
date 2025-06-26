//
//  RandomUserDTO.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import Foundation

struct RandomUserDTO: Codable {
    let results: [RandomUser]
}

struct RandomUser: Codable, Identifiable {
    let id = UUID()
    let name: Name
    let email: String
    let phone: String
    let picture: Picture

    enum CodingKeys: String, CodingKey {
        case name, email, phone, picture
    }

    struct Name: Codable {
        let title: String
        let first: String
        let last: String

        var fullName: String {
            "\(title) \(first) \(last)"
        }
    }

    struct Picture: Codable {
        let large: String
        let thumbnail: String
    }
    
    func toDomain() -> User {
        return User(id: id.uuidString, name: name.fullName, thumbImage: picture.thumbnail)
    }
}
