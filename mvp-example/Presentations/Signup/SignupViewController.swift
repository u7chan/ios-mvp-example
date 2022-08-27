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

        // Do any additional setup after loading the view.
    }
}
