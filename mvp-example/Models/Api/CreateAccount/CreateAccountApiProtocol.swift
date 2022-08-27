//
//  CreateAccountApiProtocol.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

/// @mockable(typealias: T = AnyObject; U = StringProtocol)
protocol CreateAccountApiProtocol: AnyObject {
    func create(params: CreateAccountApiRequest) async throws -> CreateAccountApiResponse
}
