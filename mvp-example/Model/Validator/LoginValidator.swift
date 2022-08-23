//
//  LoginValidator.swift
//  mvp-example
//
//  Created by unagami on 2022/08/23.
//

import Foundation

struct LoginValidator {
    struct Const {
        static let kUserNameError = "Username cannot be empty."
        static let kPasswordError = "Password cannot be empty."
    }

    static func validateUserName(userName: String) throws {
        if userName.isEmpty {
            throw DomainError.validationError(reason: Const.kUserNameError)
        }
    }

    static func validatePassword(password: String) throws {
        if password.isEmpty {
            throw DomainError.validationError(reason: Const.kPasswordError)
        }
    }
}
