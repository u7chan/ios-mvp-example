//
//  CreateAccountRequest.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

struct CreateAccountRequest: Codable {
    let email: String
    let password: String
}
