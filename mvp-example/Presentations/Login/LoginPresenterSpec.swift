//
//  LoginPresenterSpec.swift
//  mvp-exampleTests
//
//  Created by unagami on 2022/08/28.
//

import Foundation
@testable import mvp_example
import Nimble
import Quick

final class LoginPresenterSpec: QuickSpec {
    private let defaultTimeout: DispatchTimeInterval = .seconds(10)
    // swiftlint:disable function_body_length
    override func spec() {
        describe("LoginPresenterのテスト") {
            var useCaseMock: LoginUseCaseProtocolMock!
            var viewMock: LoginViewProtocolMock!
            var presenter: LoginPresenterProtocol!

            beforeEach {
                useCaseMock = LoginUseCaseProtocolMock()
                viewMock = LoginViewProtocolMock()
                presenter = LoginPresenter(executor: ExecutorTest(), loginUseCase: useCaseMock)
                presenter.attachView(view: viewMock)
            }

            context("ログインボタン押下") {
                it("正常系") {
                    // Given
                    let expectEmail = "#email"
                    let expectPassword = "#password"
                    var actualEmail = ""
                    var actualPassword = ""
                    useCaseMock.invokeHandler = { (email, password) in
                        actualEmail = email
                        actualPassword = password
                    }

                    // When
                    waitUntil(timeout: self.defaultTimeout) { done in
                        presenter.loginButtonTapped(email: expectEmail, password: expectPassword)
                        viewMock.navigateToDashboardHandler = {
                            done()
                        }
                    }

                    // Then
                    expect(actualEmail).to(equal(expectEmail))
                    expect(actualPassword).to(equal(expectPassword))
                    expect(viewMock.showProgressCallCount).to(equal(1))
                    expect(viewMock.hideProgressCallCount).to(equal(1))
                    expect(viewMock.navigateToDashboardCallCount).to(equal(1))
                }

                context("異常系") {
                    it("unknownError") {
                        // Given
                        let expectErrorMessage = "予期せぬエラーが発生しました"
                        var actualErrorMessage = ""
                        useCaseMock.invokeHandler = { (_, _) in
                            throw NSError(domain: "Test", code: -1) // Unknown error
                        }

                        // When
                        waitUntil(timeout: self.defaultTimeout) { done in
                            presenter.loginButtonTapped(email: "#any", password: "#any")
                            viewMock.showErrorHandler = { message in
                                actualErrorMessage = message
                                done()
                            }
                        }

                        // Then
                        expect(actualErrorMessage).to(equal(expectErrorMessage))
                        expect(viewMock.showProgressCallCount).to(equal(1))
                        expect(viewMock.hideProgressCallCount).to(equal(1))
                        expect(viewMock.showErrorCallCount).to(equal(1))
                    }

                    it("networkUnableError") {
                        // Given
                        let expectErrorMessage = "ネットワークに接続できませんでした"
                        var actualErrorMessage = ""
                        useCaseMock.invokeHandler = { (_, _) in
                            throw ApiError.networkUnableError
                        }

                        // When
                        waitUntil(timeout: self.defaultTimeout) { done in
                            presenter.loginButtonTapped(email: "#any", password: "#any")
                            viewMock.showErrorHandler = { message in
                                actualErrorMessage = message
                                done()
                            }
                        }

                        // Then
                        expect(actualErrorMessage).to(equal(expectErrorMessage))
                        expect(viewMock.showProgressCallCount).to(equal(1))
                        expect(viewMock.hideProgressCallCount).to(equal(1))
                        expect(viewMock.showErrorCallCount).to(equal(1))
                    }

                    it("validationError") {
                        // Given
                        let expectErrorMessage = "#any_validation_error"
                        var actualErrorMessage = ""
                        useCaseMock.invokeHandler = { (_, _) in
                            throw DomainError.validationError(reason: expectErrorMessage)
                        }

                        // When
                        waitUntil(timeout: self.defaultTimeout) { done in
                            presenter.loginButtonTapped(email: "#any", password: "#any")
                            viewMock.showErrorHandler = { message in
                                actualErrorMessage = message
                                done()
                            }
                        }

                        // Then
                        expect(actualErrorMessage).to(equal(expectErrorMessage))
                        expect(viewMock.showProgressCallCount).to(equal(1))
                        expect(viewMock.hideProgressCallCount).to(equal(1))
                        expect(viewMock.showErrorCallCount).to(equal(1))
                    }
                }
            }

            context("サインアップボタン押下") {
                it("正常系") {
                    // When
                    presenter.signupButtonTapped()

                    // Then
                    expect(viewMock.navigateToSignupCallCount).to(equal(1))
                }
            }
        }
    }
}
