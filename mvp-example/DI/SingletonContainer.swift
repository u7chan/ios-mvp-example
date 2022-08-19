//
//  SingletonContainer.swift
//  mvp-example
//
//  Created by unagami on 2022/08/20.
//

import Foundation

final class SingletonContainer {
    let apiModules: ApiModules
    let reopositoryModules: ReopositoryModules
    let useCaseModules: UseCaseModules

    private init() {
        self.apiModules = ApiModules.inject()
        self.reopositoryModules = ReopositoryModules.inject(depsModules: self.apiModules)
        self.useCaseModules = UseCaseModules.inject(depsModules: self.reopositoryModules)
    }

    static let shared = SingletonContainer()
}
