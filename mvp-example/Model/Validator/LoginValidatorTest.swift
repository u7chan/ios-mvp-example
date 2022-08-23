//
//  LoginValidatorTest.swift
//  mvp-exampleTests
//
//  Created by unagami on 2022/08/23.
//

@testable import mvp_example
import XCTest

final class LoginValidatorTest: XCTestCase {
    func test_ユーザー名の検証_正常系() throws {
        XCTAssertNoThrow(try LoginValidator.validateUserName(userName: "dummy"))
    }

    func test_ユーザー名の検証_異常系() throws {
        let expect = DomainError.validationError(reason: LoginValidator.Const.kUserNameError)
        XCTAssertThrowsError(try LoginValidator.validateUserName(userName: "")) { error in
            XCTAssert(expect == error)
        }
    }

    func test_パスワードの検証_正常系() throws {
        XCTAssertNoThrow(try LoginValidator.validatePassword(password: "dummy"))
    }

    func test_パスワードの検証_異常系() throws {
        let expect = DomainError.validationError(reason: LoginValidator.Const.kPasswordError)
        XCTAssertThrowsError(try LoginValidator.validatePassword(password: "")) { error in
            XCTAssert(expect == error)
        }
    }
}
