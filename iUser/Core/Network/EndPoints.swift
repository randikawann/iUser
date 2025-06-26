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
            return "https://mocki.io/v1/4a602390-f62c-4ed1-b6f0-d37f759115dd"
        }
    }
}
