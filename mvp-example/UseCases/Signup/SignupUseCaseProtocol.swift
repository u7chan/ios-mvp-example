//
//  SignupUseCaseProtocol.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

/// @mockable(typealias: T = AnyObject; U = StringProtocol)
protocol SignupUseCaseProtocol: AnyObject {
    func invoke(email: String, password: String, confirmPassword: String) async throws
}
