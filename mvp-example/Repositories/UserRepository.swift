//
//  UserRepository.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

final class UserRepository {
    private let loginApi: LoginApiProtocol
    private var singedInUser: User?

    init(loginApi: LoginApiProtocol) {
        self.loginApi = loginApi
    }
}

// MARK: - UserRepositoryProtocol

extension UserRepository: UserRepositoryProtocol {
    func authenticate(userName: String, password: String) async throws {
        let result = try await self.loginApi.singin(params: LoginApiRequest(name: userName, password: password))
        self.singedInUser = User(id: result.userId, name: result.name, expireAt: result.expireAt)
    }
}
