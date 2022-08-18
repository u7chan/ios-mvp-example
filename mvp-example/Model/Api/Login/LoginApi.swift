//
//  LoginApi.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

protocol LoginApi: AnyObject {
    func singin(params: LoginApiRequest) async throws -> LoginApiResponse
}
