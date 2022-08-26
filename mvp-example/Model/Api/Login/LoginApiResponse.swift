//
//  LoginApiResponse.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

struct LoginApiData: Codable {
    let userId: Int
    let name: String
    let expireAt: String
}

struct LoginApiResponse: Codable {
    let data: LoginApiData
}
