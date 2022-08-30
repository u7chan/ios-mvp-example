//
//  LoginPresenterSpec.swift
//  mvp-exampleTests
//
//  Created by unagami on 2022/08/28.
//

@testable import mvp_example
import Nimble
import Quick

final class LoginPresenterSpec: QuickSpec {
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
                    waitUntil { done in
                        presenter.loginButtonTapped(email: expectEmail, password: expectPassword)
                        viewMock.navigateToDashboardHandler = {
                            done()
                        }
                    }

                    // Then
                    expect(actualEmail).to(equal(expectEmail))
                    expect(actualPassword).to(equal(expectPassword))
                    expect(viewMock.hideProgressCallCount).to(equal(1))
                    expect(viewMock.showProgressCallCount).to(equal(1))
                    expect(viewMock.hideProgressCallCount).to(equal(1))
                    expect(viewMock.navigateToDashboardCallCount).to(equal(1))
                }
            }
        }
    }
}
