//
//  LoginUseCase.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

final class LoginUseCase {
    let userRepository: UserRepositoryProtocol
    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
}

// MARK: - LoginUseCaseProtocol

extension LoginUseCase: LoginUseCaseProtocol {
    func invoke(userName: String, password: String) async throws {
        try LoginValidator.validateUserName(userName: userName)
        try LoginValidator.validatePassword(password: password)
        try await self.userRepository.authenticate(userName: userName, password: password)
    }
}
