//
//  SignupPresenter.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

final class SignupPresenter {
    private weak var view: SignupViewProtocol?

    private let executor: ExecutorProtocol
    private let signupUseCase: SignupUseCaseProtocol

    init(
        executor: ExecutorProtocol,
        signupUseCase: SignupUseCaseProtocol
    ) {
        self.executor = executor
        self.signupUseCase = signupUseCase
    }
}

// MARK: - CreateAccountPresenterProtocol

extension SignupPresenter: SignupPresenterProtocol {
    func attachView(view: SignupViewProtocol) {
        self.view = view
    }

    func signupButtonTapped(email: String, password: String) {
        self.view?.showProgress()
        self.executor.runCatchAsync {
            try await self.signupUseCase.invoke(email: email, password: password)
        } success: {
            self.view?.hideProgress()
            self.view?.navigateToDashboard()
        } failure: { error in
            self.view?.hideProgress()
            switch error {
            case ApiError.networkUnableError:
                self.view?.showError(message: "ネットワークに接続できませんでした") // TODO: const message
            case let DomainError.validationError(reason):
                self.view?.showError(message: reason)
            default:
                self.view?.showError(message: "予期せぬエラーが発生しました") // TODO: const message
            }
        }
    }
}
