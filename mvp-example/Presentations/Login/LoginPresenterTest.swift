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
        self.presenter = LoginPresenter(loginUseCase: useCaseMock)
        self.presenter.attachView(view: viewMock)
    }

    func test_ログイン処理_正常系() throws {
        let exp = expectation(description: "TimeOut")

        XCTContext.runActivity(named: "ユースケースのパラメータを検証") { _ in
            self.useCaseMock.invokeHandler = { (userName, password) in
                XCTAssertEqual("#user", userName)
                XCTAssertEqual("#password", password)
                exp.fulfill()
            }
        }

        self.presenter.doLogin(userName: "#user", password: "#password")

        XCTContext.runActivity(named: "プログレス表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.showProgressCallCount)
        }

        XCTContext.runActivity(named: "ユースケースの呼び出しを検証") { _ in
            XCTAssertEqual(1, self.useCaseMock.invokeCallCount)
        }

        wait(for: [exp], timeout: 5.0)

        XCTContext.runActivity(named: "プログレス非表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.hideProgressCallCount)
        }

        XCTContext.runActivity(named: "画面遷移の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.navigateToDashboardCallCount)
        }
    }

    func test_ログイン処理_異常系_unknownError() throws {
        let exp = expectation(description: "TimeOut")

        self.useCaseMock.invokeHandler = { (_, _) in
            exp.fulfill()
            throw NSError(domain: "Test", code: -1) // unknownError
        }

        XCTContext.runActivity(named: "エラー表示の文言を検証") { _ in
            self.viewMock.showErrorHandler = { (message) in
                XCTAssertEqual("予期せぬエラーが発生しました", message)
            }
        }

        self.presenter.doLogin(userName: "#user", password: "#password")

        wait(for: [exp], timeout: 5.0)

        XCTContext.runActivity(named: "プログレス非表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.hideProgressCallCount)
        }

        XCTContext.runActivity(named: "エラー表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.showErrorCallCount)
        }
    }

    func test_ログイン処理_異常系_networkUnableError() throws {
        let exp = expectation(description: "TimeOut")

        self.useCaseMock.invokeHandler = { (_, _) in
            exp.fulfill()
            throw ApiError.networkUnableError
        }

        XCTContext.runActivity(named: "エラー表示の文言を検証") { _ in
            self.viewMock.showErrorHandler = { (message) in
                XCTAssertEqual("ネットワークに接続できませんでした", message)
            }
        }

        self.presenter.doLogin(userName: "#user", password: "#password")

        wait(for: [exp], timeout: 5.0)

        XCTContext.runActivity(named: "プログレス非表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.hideProgressCallCount)
        }

        XCTContext.runActivity(named: "エラー表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.showErrorCallCount)
        }
    }

    func test_ログイン処理_異常系_validationError() throws {
        let exp = expectation(description: "TimeOut")

        self.useCaseMock.invokeHandler = { (_, _) in
            exp.fulfill()
            throw DomainError.validationError(reason: "#invalid")
        }

        XCTContext.runActivity(named: "エラー表示の文言を検証") { _ in
            self.viewMock.showErrorHandler = { (message) in
                XCTAssertEqual("#invalid", message)
            }
        }

        self.presenter.doLogin(userName: "", password: "")

        wait(for: [exp], timeout: 5.0)

        XCTContext.runActivity(named: "プログレス非表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.hideProgressCallCount)
        }

        XCTContext.runActivity(named: "エラー表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.showErrorCallCount)
        }
    }
}
