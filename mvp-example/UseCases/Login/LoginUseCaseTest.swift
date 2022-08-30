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
        // Given
        let expectEmail = "#email"
        let expectPassword = "#password"
        var actualEmail = ""
        var actualPassword = ""
        self.repositoryMock.authenticateHandler = { (email, password) in
            actualEmail = email
            actualPassword = password
        }

        // When
        self.runAsyncTest {
            try await self.useCase.invoke(email: expectEmail, password: expectPassword)
        } catchError: { _ in
            XCTFail("[!] ここが呼ばれたらテストに失敗")
        }

        // Then
        XCTAssertEqual(expectEmail, actualEmail)
        XCTAssertEqual(expectPassword, actualPassword)
        XCTAssertEqual(1, self.repositoryMock.authenticateCallCount)
    }

    func test_ユースケースの実行_異常系_userNameEmpty() throws {
        // When
        self.runAsyncTest {
            try await self.useCase.invoke(email: "", password: "#any")
            XCTFail("[!] ここが呼ばれたらテストに失敗")
        } catchError: { _ in
            // NOP
        }

        // Then
        XCTAssertEqual(0, self.repositoryMock.authenticateCallCount)
    }

    func test_ユースケースの実行_異常系_passwordEmpty() throws {
        // When
        self.runAsyncTest {
            try await self.useCase.invoke(email: "#any", password: "")
            XCTFail("[!] ここが呼ばれたらテストに失敗")
        } catchError: { _ in
            // NOP
        }

        // Then
        XCTAssertEqual(0, self.repositoryMock.authenticateCallCount)
    }
}
