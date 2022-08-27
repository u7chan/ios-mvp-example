//
//  ReopositoryModules.swift
//  mvp-example
//
//  Created by unagami on 2022/08/20.
//

import Foundation

struct ReopositoryModules {
    let userRepository: UserRepositoryProtocol

    static func inject(depsModules: ApiModules) -> ReopositoryModules {
        ReopositoryModules(
            userRepository: UserRepository(
                loginApi: depsModules.loginApi,
                createAccountApi: depsModules.createAccountApi
            )
        )
    }
}
