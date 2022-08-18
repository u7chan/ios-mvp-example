//
//  LoginPresenter.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import Foundation

// MARK: - Presenter Implementation

final class LoginPresenterImpl {
    private weak var view: LoginView?
}

// MARK: - LoginPresenter Delegate

extension LoginPresenterImpl: LoginPresenter {
    func viewAttach(view: LoginView) {
        self.view = view
    }

    func doLogin() {
        guard let view = self.view else { return }
        view.navigateToDashboard()
    }
}
