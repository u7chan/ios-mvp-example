//
//  UserValidatorTest.swift
//  mvp-exampleTests
//
//  Created by unagami on 2022/08/23.
//

@testable import mvp_example
import XCTest

final class UserValidatorTest: XCTestCase {
    func test_Emailの検証_正常系() throws {
        XCTAssertNoThrow(try UserValidator.validateEmail(email: "#email"))
    }

    func test_Emailの検証_異常系() throws {
        let expect = DomainError.validationError(reason: UserValidator.Const.kEmailError)
        XCTAssertThrowsError(try UserValidator.validateEmail(email: "")) { actual in
            XCTAssert(expect == actual)
        }
    }

    func test_パスワードの検証_正常系() throws {
        XCTAssertNoThrow(try UserValidator.validatePassword(password: "#password"))
    }

    func test_パスワードの検証_異常系() throws {
        let expect = DomainError.validationError(reason: UserValidator.Const.kPasswordError)
        XCTAssertThrowsError(try UserValidator.validatePassword(password: "")) { actual in
            XCTAssert(expect == actual)
        }
    }

    func test_確認パスワードの検証_正常系() throws {
        XCTAssertNoThrow(try UserValidator.validateConfirmPassword(password: "#password", confirmPassword: "#password"))
    }

    func test_確認パスワードの検証_異常系() throws {
        let expect = DomainError.validationError(reason: UserValidator.Const.kConfirmPasswordError)
        XCTAssertThrowsError(try UserValidator.validateConfirmPassword(password: "#password", confirmPassword: "#password_")) { actual in
            XCTAssert(expect == actual)
        }
    }
}
