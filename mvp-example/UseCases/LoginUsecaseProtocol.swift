//
//  LoginUseCaseProtocol.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

/// @mockable(typealias: T = AnyObject; U = StringProtocol)
protocol LoginUseCaseProtocol: AnyObject {
    func invoke(userName: String, password: String) async throws
}
