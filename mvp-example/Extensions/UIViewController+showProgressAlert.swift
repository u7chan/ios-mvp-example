//
//  UIViewController+showProgressAlert.swift
//  mvp-example
//
//  Created by unagami on 2022/08/21.
//

import UIKit

extension UIViewController {
    func showProgressAlert(text: String = "Please wait ...") {
        let alert = UIAlertController(title: text,
                                      message: "",
                                      preferredStyle: .alert)
        let indicatorView = UIActivityIndicatorView(style: .medium)
        indicatorView.center = CGPoint(x: 60, y: 30)
        indicatorView.startAnimating()
        alert.view.addSubview(indicatorView)
        self.present(alert, animated: true, completion: nil)
    }
}
