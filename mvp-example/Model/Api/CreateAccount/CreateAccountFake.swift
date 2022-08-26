//
//  CreateAccountFake.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

final class CreateAccountFake {}

// MARK: - CreateAccountProtocol

extension CreateAccountFake: CreateAccountProtocol {
    func create(params: CreateAccountRequest) async throws -> CreateAccountResponse {
        await Task.sleepMillis(millis: 1000)
        let reponseJSON = """
        {
          "data": {
            "id": 1
          }
        }
        """
        return try reponseJSON.decodeJSON(CreateAccountResponse.self)
    }
}
