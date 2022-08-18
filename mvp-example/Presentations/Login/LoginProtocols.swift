//
//  LoginProtocols.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import Foundation

protocol LoginViewProtocol: AnyObject {
    func showProgress()
    func hideProgress()
    func navigateToDashboard()
}

protocol LoginPresenterProtocol: AnyObject {
    func attachView(view: LoginViewProtocol)
    func doLogin(userName: String, password: String)
}
