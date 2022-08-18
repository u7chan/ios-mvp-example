//
//  VCModules.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import UIKit

struct VCModules {
    static func createLoginViewController() -> UIViewController {
        let presenter = LoginPresenter()
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
