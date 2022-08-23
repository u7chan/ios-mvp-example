//
//  Equatable+Error.swift
//  mvp-example
//
//  Created by unagami on 2022/08/23.
//

import Foundation

func == (lhs: Error, rhs: Error) -> Bool {
    guard type(of: lhs) == type(of: rhs) else { return false }
    let errorLhs = lhs as NSError
    let errorRhs = rhs as NSError
    return errorLhs.domain == errorRhs.domain
        && errorLhs.code == errorRhs.code
        && "\(lhs)" == "\(rhs)"
}

extension Equatable where Self: Error {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs as Error == rhs as Error
    }
}
