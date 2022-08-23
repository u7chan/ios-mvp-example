//
//  DomainError.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

enum DomainError: Error, Equatable {
    case validationError(reason: String)
}
