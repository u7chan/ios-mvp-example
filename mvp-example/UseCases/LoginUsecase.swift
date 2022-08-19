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

// MARK: - LoginUsecaseProtocol

extension LoginUseCase: LoginUseCaseProtocol {
    func invoke(userName: String, password: String) async throws {
        try await self.userRepository.singin(userName: userName, password: password)
    }
}
