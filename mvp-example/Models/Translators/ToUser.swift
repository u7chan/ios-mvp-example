//
//  ToUser.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

extension LoginApiResponse {
    func toUser() -> User {
        let data = self.data
        return User(
            id: data.id,
            name: data.name,
            email: data.email,
            expireAt: data.expireAt
        )
    }
}
