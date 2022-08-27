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

    func test_ログイン処理_正常系() throws {
        XCTContext.runActivity(named: "ユースケースメソッドのパラメータを検証") { _ in
            self.useCaseMock.invokeHandler = { (email, password) in
                XCTAssertEqual("#email", email)
                XCTAssertEqual("#password", password)
            }
        }

        self.presenter.doLogin(email: "#email", password: "#password")

        XCTContext.runActivity(named: "プログレス表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.showProgressCallCount)
        }

        XCTContext.runActivity(named: "ユースケースメソッドの呼び出しを検証") { _ in
            XCTAssertEqual(1, self.useCaseMock.invokeCallCount)
        }

        XCTContext.runActivity(named: "プログレス非表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.hideProgressCallCount)
        }

        XCTContext.runActivity(named: "画面遷移の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.navigateToDashboardCallCount)
        }
    }

    func test_ログイン処理_異常系_unknownError() throws {
        self.useCaseMock.invokeHandler = { (_, _) in
            throw NSError(domain: "Test", code: -1) // Throwing unknown error
        }

        XCTContext.runActivity(named: "エラー表示の文言を検証") { _ in
            self.viewMock.showErrorHandler = { (message) in
                XCTAssertEqual("予期せぬエラーが発生しました", message)
            }
        }

        self.presenter.doLogin(email: "", password: "")

        XCTContext.runActivity(named: "プログレス非表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.hideProgressCallCount)
        }

        XCTContext.runActivity(named: "エラー表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.showErrorCallCount)
        }
    }

    func test_ログイン処理_異常系_networkUnableError() throws {
        self.useCaseMock.invokeHandler = { (_, _) in
            throw ApiError.networkUnableError
        }

        XCTContext.runActivity(named: "エラー表示の文言を検証") { _ in
            self.viewMock.showErrorHandler = { (message) in
                XCTAssertEqual("ネットワークに接続できませんでした", message)
            }
        }

        self.presenter.doLogin(email: "", password: "")

        XCTContext.runActivity(named: "プログレス非表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.hideProgressCallCount)
        }

        XCTContext.runActivity(named: "エラー表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.showErrorCallCount)
        }
    }

    func test_ログイン処理_異常系_validationError() throws {
        self.useCaseMock.invokeHandler = { (_, _) in
            throw DomainError.validationError(reason: "#invalid")
        }

        XCTContext.runActivity(named: "エラー表示の文言を検証") { _ in
            self.viewMock.showErrorHandler = { (message) in
                XCTAssertEqual("#invalid", message)
            }
        }

        self.presenter.doLogin(email: "", password: "")

        XCTContext.runActivity(named: "プログレス非表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.hideProgressCallCount)
        }

        XCTContext.runActivity(named: "エラー表示の呼び出しを検証") { _ in
            XCTAssertEqual(1, self.viewMock.showErrorCallCount)
        }
    }
}
