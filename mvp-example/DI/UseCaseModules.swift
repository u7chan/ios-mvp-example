//
//  UseCaseModules.swift
//  mvp-example
//
//  Created by unagami on 2022/08/20.
//

import Foundation

struct UseCaseModules {
    let loginUsecase: LoginUsecaseProtocol

    static func inject(depsModules: ReopositoryModules) -> UseCaseModules {
        UseCaseModules(
            loginUsecase: LoginUsecase(userRepository: depsModules.userRepository)
        )
    }
}
