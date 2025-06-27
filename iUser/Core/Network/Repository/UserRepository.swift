//
//  UserRepository.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

final class UserRepository: UserRepositoryProtocol {
    private let apiManager = APIManager.shared
    
    func fetchRandomUsers(completion: @escaping (Bool, [User]?, NetworkError?) -> Void) {
        apiManager.request(endpoint: .getRandomUsers) { (isSuccess: Bool, dto: RandomUserDTO?, error: NetworkError?) in
            if isSuccess, let dto = dto {
                let users = dto.results.map { $0.toDomain() }
                completion(true, users, nil)
            } else {
                completion(false, nil, error)
            }
        }
    }
}
