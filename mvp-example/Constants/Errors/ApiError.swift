//
//  ApiError.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

enum ApiError: Error {
    case networkUnableError
    case timeoutError
    case serverError
    case authorizationError
    case badRequestError
    case responseParseError
}
