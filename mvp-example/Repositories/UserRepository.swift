//
//  UserRepository.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

final class UserRepository {
    private let loginApi: LoginApiProtocol
    private var signedInUser: User?

    init(loginApi: LoginApiProtocol) {
        self.loginApi = loginApi
    }
}

// MARK: - UserRepositoryProtocol

extension UserRepository: UserRepositoryProtocol {
    func authenticate(userName: String, password: String) async throws {
        let request = LoginApiRequest(name: userName, password: password)
        let result = try await self.loginApi.login(params: request)
        self.signedInUser = User(id: result.userId, name: result.name, expireAt: result.expireAt)
    }

    func fetchSignedInUser() async throws -> User? {
        self.signedInUser
    }
}
