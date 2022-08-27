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
        /* throw ApiError.networkUnableError */
        let reponseJSON = """
        {
          "data": {
            "id": 1,
            "name": "fakejp",
            "expireAt": "2022-08-26T15:49:57+0900"
          }
        }
        """
        return try reponseJSON.decodeJSON(LoginApiResponse.self)
    }
}
