//
//  Task+sleepMillis.swift
//  mvp-example
//
//  Created by unagami on 2022/08/18.
//

import Foundation

extension Task where Success == Never, Failure == Never {
    static func sleepMillis(millis duration: UInt64) async {
        try? await Task.sleep(nanoseconds: 1_000_000 * duration)
    }
}
