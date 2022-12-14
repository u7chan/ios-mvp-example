//
//  ExecutorProtocol.swift
//  mvp-example
//
//  Created by unagami on 2022/08/24.
//

import Foundation

protocol ExecutorProtocol: AnyObject {
    func runCatchAsync(
        closure: @escaping () async throws -> Void,
        success: @escaping () -> Void,
        failure: @escaping (Error) -> Void
    )
}
