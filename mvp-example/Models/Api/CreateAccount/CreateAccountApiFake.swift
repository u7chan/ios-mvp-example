//
//  CreateAccountApiFake.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

final class CreateAccountApiFake {}

// MARK: - CreateAccountApiProtocol

extension CreateAccountApiFake: CreateAccountApiProtocol {
    func create(params: CreateAccountApiRequest) async throws -> CreateAccountApiResponse {
        await Task.sleepMillis(millis: 1000)
        let reponseJSON = """
        {
          "data": {
            "id": 1
          }
        }
        """
        return try reponseJSON.decodeJSON(CreateAccountApiResponse.self)
    }
}
