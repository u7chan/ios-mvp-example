//
//  LoginUseCaseTest.swift
//  mvp-exampleTests
//
//  Created by unagami on 2022/08/23.
//

@testable import mvp_example
import XCTest

final class LoginUseCaseTest: XCTestCase {
    private var repositoryMock: UserRepositoryProtocolMock!
    private var useCase: LoginUseCaseProtocol!

    override func setUpWithError() throws {
        self.repositoryMock = UserRepositoryProtocolMock()
        self.useCase = LoginUseCase(userRepository: self.repositoryMock)
    }

    func test_ユースケースの実行_正常系() throws {
        XCTContext.runActivity(named: "リポジトリメソッドのパラメータを検証") { _ in
            self.repositoryMock.authenticateHandler = { (email, password) in
                XCTAssertEqual("#email", email)
                XCTAssertEqual("#password", password)
            }
        }

        self.runAsyncTest {
            try await self.useCase.invoke(email: "#email", password: "#password")
        } catchError: { _ in
            XCTFail("[!] ここが呼ばれたらテストに失敗")
        }

        XCTContext.runActivity(named: "リポジトリメソッドの呼び出しを検証") { _ in
            XCTAssertEqual(1, self.repositoryMock.authenticateCallCount)
        }
    }

    func test_ユースケースの実行_異常系_userNameEmpty() throws {
        self.runAsyncTest {
            try await self.useCase.invoke(email: "", password: "#password")
            XCTFail("[!] ここが呼ばれたらテストに失敗")
        } catchError: { _ in
            // NOP
        }

        XCTContext.runActivity(named: "リポジトリメソッドの呼び出しを検証") { _ in
            XCTAssertEqual(0, self.repositoryMock.authenticateCallCount)
        }
    }

    func test_ユースケースの実行_異常系_passwordEmpty() throws {
        self.runAsyncTest {
            try await self.useCase.invoke(email: "#user", password: "")
            XCTFail("[!] ここが呼ばれたらテストに失敗")
        } catchError: { _ in
            // NOP
        }

        XCTContext.runActivity(named: "リポジトリメソッドの呼び出しを検証") { _ in
            XCTAssertEqual(0, self.repositoryMock.authenticateCallCount)
        }
    }
}
