//
//  LoginPresenter.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import Foundation

final class LoginPresenter {
    private weak var view: LoginViewProtocol?
}

// MARK: - LoginPresenterProtocol

extension LoginPresenter: LoginPresenterProtocol {
    func viewAttach(view: LoginViewProtocol) {
        self.view = view
    }

    func doLogin() {
        guard let view = self.view else { return }
        view.navigateToDashboard()
    }
}
