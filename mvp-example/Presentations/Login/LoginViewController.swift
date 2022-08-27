//
//  LoginViewController.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import UIKit

final class LoginViewController: UIViewController {
    private let presenter: LoginPresenterProtocol

    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: String(describing: LoginViewController.self), bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.attachView(view: self)
    }

    @IBAction private func loginButton(_ sender: Any) {
        self.presenter.doLogin(email: "dummy", password: "hoge")
    }

    @IBAction private func signupButton(_ sender: Any) {
        self.present(VCFactory.createSignupViewController(), animated: true)
    }
}

// MARK: - LoginViewProtocol

extension LoginViewController: LoginViewProtocol {
    func showProgress() {
        ProgressHUD.show()
    }

    func hideProgress() {
        ProgressHUD.hide()
    }

    func showError(message: String) {
        self.showAlert(title: message, message: "", positiveTitle: "OK")
    }

    func navigateToDashboard() {
        self.present(VCFactory.createDashboardViewController(), animated: false)
    }
}
