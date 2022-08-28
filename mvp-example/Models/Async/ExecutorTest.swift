//
//  ExecutorTest.swift
//  mvp-exampleTests
//
//  Created by unagami on 2022/08/28.
//

import Foundation
@testable import mvp_example

final class ExecutorTest {}

// MARK: - ExecutorProtocol

extension ExecutorTest: ExecutorProtocol {
    func runCatchAsync(
        closure: @escaping () async throws -> Void,
        success: @escaping () -> Void,
        failure: @escaping (Error) -> Void
    ) {
        Task {
            do {
                try await closure()
                success()
            } catch {
                failure(error)
            }
        }
    }
}
