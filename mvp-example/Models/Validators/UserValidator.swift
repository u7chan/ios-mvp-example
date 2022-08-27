//
//  UserValidator.swift
//  mvp-example
//
//  Created by unagami on 2022/08/23.
//

import Foundation

struct UserValidator {
    struct Const {
        static let kEmailError = "Email cannot be empty."
        static let kPasswordError = "Password cannot be empty."
    }

    static func validateEmail(email: String) throws {
        if email.isEmpty {
            throw DomainError.validationError(reason: Const.kEmailError)
        }
    }

    static func validatePassword(password: String) throws {
        if password.isEmpty {
            throw DomainError.validationError(reason: Const.kPasswordError)
        }
    }
}
