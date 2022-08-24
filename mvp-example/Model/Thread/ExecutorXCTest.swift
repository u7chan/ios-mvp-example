//
//  ExecutorXCTest.swift
//  mvp-exampleTests
//
//  Created by unagami on 2022/08/24.
//

@testable import mvp_example
import XCTest

final class ExecutorXCTest {
    private let testCase: XCTestCase
    private let timeout: TimeInterval
    init(
        _ testCase: XCTestCase,
        _ timeout: TimeInterval = 10
    ) {
        self.testCase = testCase
        self.timeout = timeout
    }
}

// MARK: - ExecutorProtocol

extension ExecutorXCTest: ExecutorProtocol {
    func runCatchAsync(
        closure: @escaping () async throws -> Void,
        success: @escaping () -> Void,
        failure: @escaping (Error) -> Void
    ) {
        let expectation = self.testCase.expectation(description: "Timeout")
        Task {
            do {
                try await closure()
                success()
            } catch {
                failure(error)
            }
            expectation.fulfill()
        }
        self.testCase.waitForExpectations(timeout: self.timeout)
    }
}
