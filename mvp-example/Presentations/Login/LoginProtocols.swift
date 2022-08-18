//
//  LoginProtocols.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import Foundation

protocol LoginViewProtocol: AnyObject {
    func navigateToDashboard()
    func showProgress()
    func hideProgress()
}

protocol LoginPresenterProtocol: AnyObject {
    func viewAttach(view: LoginViewProtocol)
    func doLogin(userName: String, password: String)
}
