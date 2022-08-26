//
//  CreateAccountProtocol.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

/// @mockable(typealias: T = AnyObject; U = StringProtocol)
protocol CreateAccountProtocol: AnyObject {
    func create(params: CreateAccountRequest) async throws -> CreateAccountResponse
}
