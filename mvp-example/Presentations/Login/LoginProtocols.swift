//
//  LoginProtocols.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import Foundation

// MARK: - For View Delegate

protocol LoginView: AnyObject {
    func navigateToDashboard()
}

// MARK: - For Presenter Delegate

protocol LoginPresenter: AnyObject {
    func viewAttach(view: LoginView)
    func doLogin()
}
