//
//  LoginViewController.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import UIKit

// MARK: - UIViewController Implementation

final class LoginViewController: UIViewController {
    
    private let presenter: LoginPresenter
    
    init(presenter: LoginPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: LoginViewController.self), bundle: nil)
    }
    
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

// MARK: - LoginView Delegate

extension LoginViewController: LoginView {
    
    func navigateToDashboard() {
        self.present(VCModules.createDashboardViewController(), animated: false)
    }
}
