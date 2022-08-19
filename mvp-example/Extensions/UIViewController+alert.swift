//
//  UIViewController+alert.swift
//  mvp-example
//
//  Created by unagami on 2022/08/20.
//

import UIKit

extension UIViewController {
    func showAlert(title: String,
                   message: String,
                   positiveTitle: String,
                   completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: positiveTitle, style: UIAlertAction.Style.default, handler: { _ in
            alert.dismiss(animated: true)
            if let completion = completion {
                completion()
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
