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
    
//    Mark: This method used because of not having separate apis for get single user
    func fetchSelectedUser(id: String, completion: @escaping (Bool, UserDetail?, NetworkError?) -> Void) {
        apiManager.request(endpoint: .getRandomUsers) { (isSuccess: Bool, dto: RandomUserDTO?, error: NetworkError?) in
            if isSuccess, let dto = dto {
                let users = dto.results
                
                let filterSingleUser = self.filterSingleUser(users: users, email: id)
                
                if filterSingleUser != nil {
                    completion(true, filterSingleUser, nil)
                } else {
                    completion(false, nil, nil)
                }
            } else {
                completion(false, nil, error)
            }
        }
    }
}

extension UserRepository {
    func filterSingleUser(users: [RandomUser], email: String)-> UserDetail? {
        let users = users.map { $0.toDomainSingle() }
//        let selectedUser = users.first {$0.email == email}
        let selectedUser = users.first {$0.email == ""}
        return selectedUser
    }
}

