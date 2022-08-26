//
//  CreateAccountResponse.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

struct CreateAccountResponse: Codable {
    let id: Int
    let email: String
    let password: String
}
