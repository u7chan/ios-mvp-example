//
//  UserRepository.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

final class UserRepository {
    private let loginApi: LoginApiProtocol
    private let createAccountApi: CreateAccountApiProtocol
    private var signedInUser: User?

    init(
        loginApi: LoginApiProtocol,
        createAccountApi: CreateAccountApiProtocol
    ) {
        self.loginApi = loginApi
        self.createAccountApi = createAccountApi
    }
}

// MARK: - UserRepositoryProtocol

extension UserRepository: UserRepositoryProtocol {
    func authenticate(email: String, password: String) async throws {
        let request = LoginApiRequest(email: email, password: password)
        let result = try await self.loginApi.login(params: request)
        self.signedInUser = result.toUser()
    }

    func signup(email: String, password: String) async throws {
        let request = CreateAccountApiRequest(email: email, password: password)
        _ = try await self.createAccountApi.create(params: request)
    }

    func fetchSignedInUser() async throws -> User? {
        self.signedInUser
    }
}
