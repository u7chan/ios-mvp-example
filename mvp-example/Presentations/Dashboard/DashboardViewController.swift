//
//  DashboardViewController.swift
//  mvp-example
//
//  Created by unagami on 2022/08/16.
//

import UIKit

final class DashboardViewController: UIViewController {
    private let presenter: DashboardPresenter

    init(presenter: DashboardPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: DashboardViewController.self), bundle: nil)
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
