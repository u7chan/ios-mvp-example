//
//  LoginProtocols.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import Foundation

/// @mockable(typealias: T = AnyObject; U = StringProtocol)
protocol LoginViewProtocol: AnyObject {
    func showProgress()
    func hideProgress()
    func showError(message: String)
    func navigateToDashboard()
}

protocol LoginPresenterProtocol: AnyObject {
    func attachView(view: LoginViewProtocol)
    func doLogin(email: String, password: String)
}
