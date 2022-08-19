//
//  PresenterModules.swift
//  mvp-example
//
//  Created by unagami on 2022/08/20.
//

import Foundation

struct PresenterModules {
    let loginPresenter: LoginPresenterProtocol

    static func inject(depsModules: UseCaseModules) -> PresenterModules {
        PresenterModules(
            loginPresenter: LoginPresenter(loginUseCase: depsModules.loginUseCase)
        )
    }
}
