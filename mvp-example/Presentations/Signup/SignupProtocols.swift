//
//  SignupProtocols.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

/// @mockable(typealias: T = AnyObject; U = StringProtocol)
protocol SignupViewProtocol: AnyObject {
    func showProgress()
    func hideProgress()
    func showError(message: String)
    func navigateToDashboard()
}

protocol SignupPresenterProtocol: AnyObject {
    func attachView(view: SignupViewProtocol)
    func signupButtonTapped(email: String, password: String)
}
