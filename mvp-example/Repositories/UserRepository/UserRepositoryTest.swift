//
//  UserRepositoryTest.swift
//  mvp-example
//
//  Created by unagami on 2022/08/24.
//

@testable import mvp_example
import XCTest

final class UserRepositoryTest: XCTestCase {
    private var loginApiMock: LoginApiProtocolMock!
    private var createAccountApiMock: CreateAccountApiProtocolMock!
    private var repository: UserRepositoryProtocol!

    override func setUpWithError() throws {
        self.loginApiMock = LoginApiProtocolMock()
        self.createAccountApiMock = CreateAccountApiProtocolMock()
        self.repository = UserRepository(
            loginApi: self.loginApiMock,
            createAccountApi: self.createAccountApiMock
        )
    }

    func test_認証処理_正常系() throws {
        // Given
        let expectEmail = "#email"
        let expectPassword = "#password"
        var actualEmail = ""
        var actualPassword = ""
        let expectLoginApiResponse = try """
        {
          "data": {
            "id": 1,
            "name": "#user",
            "email": "#email",
            "expireAt": "#date"
          }
        }
        """.decodeJSON(LoginApiResponse.self)

        self.loginApiMock.loginHandler = { (params) in
            actualEmail = params.email
            actualPassword = params.password
            return expectLoginApiResponse
        }

        // When
        self.runAsyncTest {
            try await self.repository.authenticate(email: "#email", password: "#password")
        } catchError: { _ in
            XCTFail("[!] ここが呼ばれたらテストに失敗")
        }

        // Then
        XCTAssertEqual(expectEmail, actualEmail)
        XCTAssertEqual(expectPassword, actualPassword)
        XCTAssertEqual(1, self.loginApiMock.loginCallCount)
    }

    func test_認証処理_異常系() throws {
        // Given
        self.loginApiMock.loginHandler = { (_) in
            throw ApiError.serverError
        }

        // When
        self.runAsyncTest {
            try await self.repository.authenticate(email: "#any", password: "#any")
            XCTFail("[!] ここが呼ばれたらテストに失敗")
        } catchError: { _ in
            // NOP
        }

        // Then
        XCTAssertEqual(1, self.loginApiMock.loginCallCount)
    }

    func test_サインイン済みユーザーを取得_正常系() throws {
        // Given
        var actualUser: User?
        let expectLoginApiResponse = try """
        {
          "data": {
            "id": 1,
            "name": "#user",
            "email": "#email",
            "expireAt": "#date"
          }
        }
        """.decodeJSON(LoginApiResponse.self)

        self.loginApiMock.loginHandler = { (_) in
            expectLoginApiResponse
        }

        // When
        self.runAsyncTest {
            try await self.repository.authenticate(email: "#email", password: "#password")
            actualUser = try await self.repository.fetchSignedInUser()
        } catchError: { _ in
            XCTFail("[!] ここが呼ばれたらテストに失敗")
        }

        // Then
        XCTAssertNotNil(actualUser)
        XCTAssertEqual(expectLoginApiResponse.data.id, actualUser?.id)
        XCTAssertEqual(expectLoginApiResponse.data.name, actualUser?.name)
        XCTAssertEqual(expectLoginApiResponse.data.email, actualUser?.email)
        XCTAssertEqual(expectLoginApiResponse.data.expireAt, actualUser?.expireAt)
    }

    func test_未サインインユーザーを取得_準正常系() throws {
        // Given
        var actualUser: User?

        // When
        self.runAsyncTest {
            actualUser = try await self.repository.fetchSignedInUser()
        } catchError: { _ in
            XCTFail("[!] ここが呼ばれたらテストに失敗")
        }

        // Then
        XCTAssertNil(actualUser)
    }
}
