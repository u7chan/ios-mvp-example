//
//  LoginApiProtocol.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

/// @mockable(typealias: T = AnyObject; U = StringProtocol)
protocol LoginApiProtocol: AnyObject {
    func login(params: LoginApiRequest) async throws -> LoginApiResponse
}
