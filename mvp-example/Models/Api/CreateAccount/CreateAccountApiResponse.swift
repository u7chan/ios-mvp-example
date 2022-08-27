//
//  CreateAccountApiResponse.swift
//  mvp-example
//
//  Created by unagami on 2022/08/27.
//

import Foundation

struct CreateAccountApiResponse: Codable {
    let data: CreateAccountApiResponseData
}

struct CreateAccountApiResponseData: Codable {
    let id: Int
}
