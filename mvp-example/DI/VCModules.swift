//
//  VCModules.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import UIKit

struct VCModules {
    static func createLoginViewController() -> UIViewController {
        let api = LoginApiFake() // TODO: Use Fake
        let repository = UserRepository(loginApi: api)
        let usecase = LoginUsecase(userRepository: repository)
        let presenter = LoginPresenter(loginUsecase: usecase)
        let vc = LoginViewController(presenter: presenter)
        vc.modalPresentationStyle = .fullScreen
        return vc
    }

    static func createDashboardViewController() -> UIViewController {
        let presenter = DashboardPresenter()
        let vc = DashboardViewController(presenter: presenter)
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
}
