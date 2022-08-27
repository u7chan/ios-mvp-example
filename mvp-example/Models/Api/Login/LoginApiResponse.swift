//
//  LoginApiResponse.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

struct LoginApiResponse: Codable {
    let data: LoginApiResponseData
}

struct LoginApiResponseData: Codable {
    let id: Int
    let name: String
    let email: String
    let expireAt: String
}
