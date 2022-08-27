//
//  SignupUseCase.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

final class SignupUseCase {
    let userRepository: UserRepositoryProtocol
    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
}

// MARK: - SignupUseCaseProtocol

extension SignupUseCase: SignupUseCaseProtocol {
    func invoke(email: String, password: String) async throws {
        try LoginValidator.validateEmail(email: email)
        try LoginValidator.validatePassword(password: password)
        try await self.userRepository.signup(email: email, password: password)
        try await self.userRepository.authenticate(email: email, password: password)
    }
}
