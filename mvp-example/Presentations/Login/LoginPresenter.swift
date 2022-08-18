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
    func attachView(view: LoginViewProtocol) {
        self.view = view
    }

    func doLogin(userName: String, password: String) {
        self.view?.showProgress()

        runCatch {
            try await self.loginUsecase.invoke(userName: userName, password: password)
        } success: {
            self.view?.hideProgress()
            self.view?.navigateToDashboard()
        } failure: { error in
            self.view?.hideProgress()
        }
    }
}
