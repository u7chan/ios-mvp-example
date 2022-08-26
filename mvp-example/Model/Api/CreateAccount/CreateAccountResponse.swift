//
//  CreateAccountResponse.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

struct CreateAccountResponse: Codable {
    let data: CreateAccountResponseData
}

struct CreateAccountResponseData: Codable {
    let id: Int
}
