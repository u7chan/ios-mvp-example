//
//  LoginApiRequest.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

struct LoginApiRequest: Codable {
    let name: String
    let password: String
}
