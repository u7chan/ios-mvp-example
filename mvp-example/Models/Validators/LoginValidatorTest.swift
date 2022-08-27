//
//  LoginValidatorTest.swift
//  mvp-exampleTests
//
//  Created by unagami on 2022/08/23.
//

@testable import mvp_example
import XCTest

final class LoginValidatorTest: XCTestCase {
    func test_Emailの検証_正常系() throws {
        XCTAssertNoThrow(try LoginValidator.validateEmail(email: "dummy"))
    }

    func test_Emailの検証_異常系() throws {
        let expect = DomainError.validationError(reason: LoginValidator.Const.kEmailError)
        XCTAssertThrowsError(try LoginValidator.validateEmail(email: "")) { actual in
            XCTAssert(expect == actual)
        }
    }

    func test_パスワードの検証_正常系() throws {
        XCTAssertNoThrow(try LoginValidator.validatePassword(password: "dummy"))
    }

    func test_パスワードの検証_異常系() throws {
        let expect = DomainError.validationError(reason: LoginValidator.Const.kPasswordError)
        XCTAssertThrowsError(try LoginValidator.validatePassword(password: "")) { actual in
            XCTAssert(expect == actual)
        }
    }
}
