//
//  LoginUsecase.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

final class LoginUsecase {
    let userRepository: UserRepositoryProtocol
    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
}

// MARK: - LoginUsecaseProtocol

extension LoginUsecase: LoginUsecaseProtocol {
    func invoke(userName: String, password: String) async throws {
        try await self.userRepository.singin(userName: userName, password: password)
    }
}
