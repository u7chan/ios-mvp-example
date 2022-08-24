//
//  LoginApiFake.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

final class LoginApiFake {}

// MARK: - LoginApiProtocol

extension LoginApiFake: LoginApiProtocol {
    func login(params: LoginApiRequest) async throws -> LoginApiResponse {
        await Task.sleepMillis(millis: 1000)
        // throw ApiError.networkUnableError
        return LoginApiResponse(userId: 1, name: "FakeMan", expireAt: "12345")
    }
}
