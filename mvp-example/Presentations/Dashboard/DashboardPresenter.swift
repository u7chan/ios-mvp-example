//
//  DashboardPresenter.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import Foundation

// MARK: - Presenter Implementation

final class DashboardPresenterImpl {
    private weak var view: DashboardView?
}

// MARK: - DashboardPresenter Delegate

extension DashboardPresenterImpl: DashboardPresenter {
    
    func viewAttach(view: DashboardView) {
        self.view = view
    }
}

