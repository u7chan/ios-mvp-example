//
//  RunCatch.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

typealias RunClosure = () async throws -> Void
typealias RunSuccess = () -> Void
typealias RunFailure = (Error) -> Void

func runCatch(
    closure: @escaping RunClosure,
    success: RunSuccess? = nil,
    failure: RunFailure? = nil
) {
    Task {
        do {
            try await closure()
            if let success = success {
                if isTesting() {
                    success()
                    return
                }
                DispatchQueue.main.async {
                    success()
                }
            }
        } catch {
            if let failure = failure {
                if isTesting() {
                    failure(error)
                    return
                }
                DispatchQueue.main.async {
                    failure(error)
                }
            }
        }
    }
}
