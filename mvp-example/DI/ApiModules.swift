//
//  ApiModules.swift
//  mvp-example
//
//  Created by unagami on 2022/08/20.
//

import Foundation

struct ApiModules {
    let loginApi: LoginApiProtocol

    static func inject() -> ApiModules {
        ApiModules(
            loginApi: LoginApiFake() // TODO: Use Fake
        )
    }
}
