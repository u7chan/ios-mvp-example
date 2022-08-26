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
            id: data.userId,
            name: data.name,
            expireAt: data.expireAt
        )
    }
}
