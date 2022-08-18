//
//  LoginProtocols.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import Foundation

protocol LoginViewProtocol: AnyObject {
    func navigateToDashboard()
}

protocol LoginPresenterProtocol: AnyObject {
    func viewAttach(view: LoginViewProtocol)
    func doLogin()
}
