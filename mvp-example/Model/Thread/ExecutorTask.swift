//
//  ExecutorTask.swift
//  mvp-example
//
//  Created by unagami on 2022/08/24.
//

import Foundation

final class ExecutorTask {}

// MARK: - ExecutorProtocol

extension ExecutorTask: ExecutorProtocol {
    func runCatchAsync(
        closure: @escaping () async throws -> Void,
        success: @escaping () -> Void,
        failure: @escaping (Error) -> Void
    ) {
        Task {
            do {
                try await closure()
                DispatchQueue.main.async {
                    success()
                }
            } catch {
                DispatchQueue.main.async {
                    failure(error)
                }
            }
        }
    }
}
