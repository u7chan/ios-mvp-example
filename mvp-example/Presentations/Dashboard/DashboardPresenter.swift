//
//  DashboardPresenter.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import Foundation

final class DashboardPresenter {
    private weak var view: DashboardViewProtocol?
}

// MARK: - DashboardPresenterProtocol

extension DashboardPresenter: DashboardPresenterProtocol {
    func viewAttach(view: DashboardViewProtocol) {
        self.view = view
    }
}
