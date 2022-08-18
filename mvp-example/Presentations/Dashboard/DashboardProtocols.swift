//
//  DashboardProtocols.swift
//  mvp-example
//
//  Created by unagami on 2022/08/17.
//

import Foundation

protocol DashboardViewProtocol: AnyObject {}

protocol DashboardPresenterProtocol: AnyObject {
    func viewAttach(view: DashboardViewProtocol)
}
