//
//  LoginPresenter.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import Foundation

final class LoginPresenter {
    private weak var view: LoginViewProtocol?
    private let loginUsecase: LoginUsecaseProtocol

    init(loginUsecase: LoginUsecaseProtocol) {
        self.loginUsecase = loginUsecase
    }
}

// MARK: - LoginPresenterProtocol

extension LoginPresenter: LoginPresenterProtocol {
    func viewAttach(view: LoginViewProtocol) {
        self.view = view
    }

    func doLogin(userName: String, password: String) {
        guard let view = self.view else { return }

        view.showProgress()

        runCatch {
            try await self.loginUsecase.invoke(userName: userName, password: password)
        } success: {
            view.hideProgress()
            view.navigateToDashboard()
        } failure: { error in
            view.hideProgress()
        }
    }
}
