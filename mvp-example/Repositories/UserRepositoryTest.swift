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
    private var repository: UserRepositoryProtocol!

    override func setUpWithError() throws {
        self.loginApiMock = LoginApiProtocolMock()
        self.repository = UserRepository(loginApi: self.loginApiMock)
    }

    func test_認証処理_正常系() throws {
        XCTContext.runActivity(named: "APIメソッドのパラメータを検証") { _ in
            self.loginApiMock.loginHandler = { (params) in
                XCTAssertEqual("#user", params.name)
                XCTAssertEqual("#password", params.password)
                return LoginApiResponse(userId: 1, name: "#user-result", expireAt: "#date")
            }
        }

        self.runAsyncTest {
            try await self.repository.authenticate(userName: "#user", password: "#password")
        } catchError: { _ in
            XCTFail("[!] ここが呼ばれたらテストに失敗")
        }

        XCTContext.runActivity(named: "APIメソッドの呼び出しを検証") { _ in
            XCTAssertEqual(1, self.loginApiMock.loginCallCount)
        }
    }

    func test_認証処理_異常系() throws {
        self.loginApiMock.loginHandler = { (_) in
            throw ApiError.serverError
        }

        self.runAsyncTest {
            try await self.repository.authenticate(userName: "#user", password: "#password")
            XCTFail("[!] ここが呼ばれたらテストに失敗")
        } catchError: { _ in
            // NOP
        }

        XCTContext.runActivity(named: "APIメソッドの呼び出しを検証") { _ in
            XCTAssertEqual(1, self.loginApiMock.loginCallCount)
        }
    }

    func test_サインイン済みユーザーを取得_正常系() throws {
        let loginApiResponse = LoginApiResponse(userId: 1, name: "#signedIn", expireAt: "#date")
        self.loginApiMock.loginHandler = { (_) in
            loginApiResponse
        }

        self.runAsyncTest {
            try await self.repository.authenticate(userName: "#user", password: "#password")
            let actual = try await self.repository.fetchSignedInUser()
            XCTAssertEqual(loginApiResponse.userId, actual?.id)
            XCTAssertEqual(loginApiResponse.name, actual?.name)
            XCTAssertEqual(loginApiResponse.expireAt, actual?.expireAt)
        } catchError: { _ in
            XCTFail("[!] ここが呼ばれたらテストに失敗")
        }
    }

    func test_未サインインユーザーを取得_準正常系() throws {
        self.runAsyncTest {
            let actual = try await self.repository.fetchSignedInUser()
            XCTAssertNil(actual)
        } catchError: { _ in
            XCTFail("[!] ここが呼ばれたらテストに失敗")
        }
    }
}
