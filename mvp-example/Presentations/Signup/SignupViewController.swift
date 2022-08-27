//
//  SignupViewController.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import UIKit

final class SignupViewController: UIViewController {
    private let presenter: SignupPresenterProtocol

    init(presenter: SignupPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: String(describing: SignupViewController.self), bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.attachView(view: self)
    }

    @IBAction private func signupButtonTapped(_ sender: Any) {
        self.presenter.doSignup(email: "dummy", password: "hoge")
    }
}

// MARK: - SignupViewProtocol

extension SignupViewController: SignupViewProtocol {
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
