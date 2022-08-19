//
//  UseCaseModules.swift
//  mvp-example
//
//  Created by unagami on 2022/08/20.
//

import Foundation

struct UseCaseModules {
    let loginUseCase: LoginUseCaseProtocol

    static func inject(depsModules: ReopositoryModules) -> UseCaseModules {
        UseCaseModules(
            loginUseCase: LoginUseCase(userRepository: depsModules.userRepository)
        )
    }
}
