//
//  CreateAccountApiRequest.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

struct CreateAccountApiRequest: Codable {
    let email: String
    let password: String
}
