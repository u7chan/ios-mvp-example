//
//  Env.swift
//  mvp-example
//
//  Created by unagami on 2022/08/22.
//

import Foundation

internal func isTesting() -> Bool {
    getEnvString() == "TEST"
}

private func getEnvString() -> String {
    ProcessInfo.processInfo.environment["RUN_ENV"] ?? "N/A"
}
