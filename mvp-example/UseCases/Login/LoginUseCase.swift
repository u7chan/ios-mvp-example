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
    func invoke(email: String, password: String) async throws {
        try UserValidator.validateEmail(email: email)
        try UserValidator.validatePassword(password: password)
        try await self.userRepository.authenticate(email: email, password: password)
    }
}
