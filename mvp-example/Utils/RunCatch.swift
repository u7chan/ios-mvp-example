//
//  RunCatch.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

internal typealias RunClosure = () async throws -> Void
internal typealias RunSuccess = () -> Void
internal typealias RunFailure = (Error) -> Void

internal func runCatch(
    closure: @escaping RunClosure,
    success: RunSuccess? = nil,
    failure: RunFailure? = nil
) {
    Task {
        do {
            try await closure()
            if let success = success {
                DispatchQueue.main.async {
                    success()
                }
            }
        } catch {
            if let failure = failure {
                DispatchQueue.main.async {
                    failure(error)
                }
            }
        }
    }
}
