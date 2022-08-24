//
//  XCTestCase+runAsyncTest.swift
//  mvp-example
//
//  Created by unagami on 2022/08/23.
//

import XCTest

extension XCTestCase {
    func runAsyncTest(
        _ testName: String = #function,
        _ file: StaticString = #file,
        _ line: UInt = #line,
        _ timeout: TimeInterval = 10,
        test: @escaping () async throws -> Void,
        catchError: ((Error) -> Void)? = nil
    ) {
        var thrownError: Error?
        let errorHandler = { thrownError = $0 }
        let expectation = expectation(description: testName)

        Task {
            do {
                try await test()
            } catch {
                errorHandler(error)
            }

            expectation.fulfill()
        }

        waitForExpectations(timeout: timeout)

        if let error = thrownError {
            if let callback = catchError {
                callback(error)
                return
            }
            XCTFail(
                "Async error thrown: \(error)",
                file: file,
                line: line
            )
        }
    }
}
