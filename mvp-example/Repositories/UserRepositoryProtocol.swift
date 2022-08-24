//
//  UserRepositoryProtocol.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

/// @mockable(typealias: T = AnyObject; U = StringProtocol)
protocol UserRepositoryProtocol: AnyObject {
    func authenticate(userName: String, password: String) async throws
    func fetchSignedInUser() async throws -> User?
}
