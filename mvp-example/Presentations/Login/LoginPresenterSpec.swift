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
                    useCaseMock.invokeHandler = { (email, password) in
                        expect(email).to(equal("#email"))
                        expect(password).to(equal("#password"))
                    }
                    waitUntil { done in
                        presenter.loginButtonTapped(email: "#email", password: "#password")
                        viewMock.navigateToDashboardHandler = {
                            done()
                        }
                    }
                    expect(viewMock.showProgressCallCount).to(equal(1))
                    expect(viewMock.hideProgressCallCount).to(equal(1))
                }
            }
        }
    }
}
