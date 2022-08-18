//
//  UserRepository.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

protocol UserRepository: AnyObject {
    func singin(userName: String, password: String) async throws
}
