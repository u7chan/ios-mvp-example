//
//  ProgressHUD.swift
//  mvp-example
//
//  Created by unagami on 2022/08/23.
//

import PKHUD

struct ProgressHUD {
    static func show() {
        HUD.show(.progress)
    }

    static func hide() {
        HUD.hide(animated: true)
    }
}
