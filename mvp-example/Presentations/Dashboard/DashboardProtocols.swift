//
//  DashboardProtocols.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import Foundation

// MARK: - For View Delegate

protocol DashboardView: AnyObject {
    
}

// MARK: - For Presenter Delegate

protocol DashboardPresenter: AnyObject {
    func viewAttach(view: DashboardView)
}
