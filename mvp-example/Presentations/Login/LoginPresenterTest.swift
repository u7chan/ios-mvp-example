//
//  LoginPresenterTest.swift
//  mvp-exampleTests
//
//  Created by unagami on 2022/08/21.
//

@testable import mvp_example
import XCTest

final class LoginPresenterTest: XCTestCase {
    private var useCaseMock: LoginUseCaseProtocolMock!
    private var viewMock: LoginViewProtocolMock!
    private var presenter: LoginPresenterProtocol!

    override func setUpWithError() throws {
        self.useCaseMock = LoginUseCaseProtocolMock()
        self.viewMock = LoginViewProtocolMock()
        self.presenter = LoginPresenter(executor: ExecutorXCTest(self), loginUseCase: useCaseMock)
        self.presenter.attachView(view: viewMock)
    }

    func test_ログインボタン押下_正常系() throws {
        // Given
        let expectEmail = "#email"
        let expectPassword = "#password"
        var actualEmail = ""
        var actualPassword = ""
        self.useCaseMock.invokeHandler = { (email, password) in
            actualEmail = email
            actualPassword = password
        }

        // When
        self.presenter.loginButtonTapped(email: expectEmail, password: expectPassword)

        // Then
        XCTAssertEqual(expectEmail, actualEmail)
        XCTAssertEqual(expectPassword, actualPassword)
        XCTAssertEqual(1, self.viewMock.showProgressCallCount)
        XCTAssertEqual(1, self.viewMock.hideProgressCallCount)
        XCTAssertEqual(1, self.viewMock.navigateToDashboardCallCount)
    }

    func test_ログインボタン押下_異常系_unknownError() throws {
        // Given
        let expectErrorMessage = "予期せぬエラーが発生しました"
        var actualErrorMessage = ""
        self.useCaseMock.invokeHandler = { (_, _) in
            throw NSError(domain: "Test", code: -1) // Unknown error
        }
        self.viewMock.showErrorHandler = { (message) in
            actualErrorMessage = message
        }

        // When
        self.presenter.loginButtonTapped(email: "", password: "")

        // Then
        XCTAssertEqual(expectErrorMessage, actualErrorMessage)
        XCTAssertEqual(1, self.viewMock.showProgressCallCount)
        XCTAssertEqual(1, self.viewMock.hideProgressCallCount)
        XCTAssertEqual(1, self.viewMock.showErrorCallCount)
    }

    func test_ログインボタン押下_異常系_networkUnableError() throws {
        // Given
        let expectErrorMessage = "ネットワークに接続できませんでした"
        var actualErrorMessage = ""
        self.useCaseMock.invokeHandler = { (_, _) in
            throw ApiError.networkUnableError
        }
        self.viewMock.showErrorHandler = { (message) in
            actualErrorMessage = message
        }

        // When
        self.presenter.loginButtonTapped(email: "", password: "")

        // Then
        XCTAssertEqual(expectErrorMessage, actualErrorMessage)
        XCTAssertEqual(1, self.viewMock.showProgressCallCount)
        XCTAssertEqual(1, self.viewMock.hideProgressCallCount)
        XCTAssertEqual(1, self.viewMock.showErrorCallCount)
    }

    func test_ログインボタン押下_異常系_validationError() throws {
        // Given
        let expectErrorMessage = "#any_validation_error"
        var actualErrorMessage = ""
        self.useCaseMock.invokeHandler = { (_, _) in
            throw DomainError.validationError(reason: expectErrorMessage)
        }
        self.viewMock.showErrorHandler = { (message) in
            actualErrorMessage = message
        }

        // When
        self.presenter.loginButtonTapped(email: "", password: "")

        // Then
        XCTAssertEqual(expectErrorMessage, actualErrorMessage)
        XCTAssertEqual(1, self.viewMock.showProgressCallCount)
        XCTAssertEqual(1, self.viewMock.hideProgressCallCount)
        XCTAssertEqual(1, self.viewMock.showErrorCallCount)
    }

    func test_サインアップボタン押下_正常系() throws {
        // When
        self.presenter.signupButtonTapped()

        // Then
        XCTAssertEqual(1, self.viewMock.navigateToSignupCallCount)
    }
}
