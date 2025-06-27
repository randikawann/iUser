//
//  EndPoints.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

enum Endpoint {
    case getRandomUsers
    
    var url: String {
        switch self {
        case .getRandomUsers:
            return "https://randomuser.me/api/?results=20"
        }
    }
}
