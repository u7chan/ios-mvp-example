//
//  Entrypoint.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import UIKit

struct Entrypoint {
    static func getFirstViewController() -> UIViewController {
        let loggedIn = false // TODO: feat
        return loggedIn ? VCFactory.createDashboardViewController() : VCFactory.createLoginViewController()
    }
}
