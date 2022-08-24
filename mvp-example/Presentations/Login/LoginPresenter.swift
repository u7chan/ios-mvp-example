//
//  LoginPresenter.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import Foundation

final class LoginPresenter {
    private weak var view: LoginViewProtocol?

    private let executor: ExecutorProtocol
    private let loginUseCase: LoginUseCaseProtocol

    init(
        executor: ExecutorProtocol,
        loginUseCase: LoginUseCaseProtocol
    ) {
        self.executor = executor
        self.loginUseCase = loginUseCase
    }
}

// MARK: - LoginPresenterProtocol

extension LoginPresenter: LoginPresenterProtocol {
    func attachView(view: LoginViewProtocol) {
        self.view = view
    }

    func doLogin(userName: String, password: String) {
        self.view?.showProgress()
        self.executor.runCatchAsync {
            try await self.loginUseCase.invoke(userName: userName, password: password)
        } success: {
            self.view?.hideProgress()
            self.view?.navigateToDashboard()
        } failure: { error in
            self.view?.hideProgress()
            switch error {
            case ApiError.networkUnableError:
                self.view?.showError(message: "ネットワークに接続できませんでした")
            case let DomainError.validationError(reason):
                self.view?.showError(message: reason)
            default:
                self.view?.showError(message: "予期せぬエラーが発生しました")
            }
        }
    }
}
