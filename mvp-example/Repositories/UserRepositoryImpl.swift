//
//  UserRepositoryImpl.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

final class UserRepositoryImpl {
    private let loginApi: LoginApi
    
    init(loginApi: LoginApi) {
        self.loginApi = loginApi
    }
}

// MARK: - UserRepository

extension UserRepositoryImpl: UserRepository {
    func singin(userName: String, password: String) async throws {
        do {
            _ = try await self.loginApi.singin(params: LoginApiRequest(name: userName, password: password))
        } catch {
            
        }
    }
}
