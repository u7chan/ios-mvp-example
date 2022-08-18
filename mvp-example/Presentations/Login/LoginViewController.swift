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
        self.presenter.viewAttach(view: self)
    }

    @IBAction func loginButton(_ sender: Any) {
        self.presenter.doLogin()
    }
}

// MARK: - LoginViewProtocol

extension LoginViewController: LoginViewProtocol {
    func navigateToDashboard() {
        self.present(VCModules.createDashboardViewController(), animated: false)
    }
}
