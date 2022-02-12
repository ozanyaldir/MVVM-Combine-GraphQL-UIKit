//
//  BaseViewController.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 12.02.2022.
//

import UIKit

class BaseViewController: UIViewController {
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
}

// MARK: Error Alert
extension BaseViewController {
    func showErrorAlert(title:String =  "Failed!", message: String, complete: (() -> ())?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true) {
                complete?()
            }
        }
    }
}

// MARK: Activity Indicator
extension BaseViewController {
    func activityIndicatorBegin() {
        activityIndicator = UIActivityIndicatorView(frame: .init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func activityIndicatorEnd() {
        self.activityIndicator.stopAnimating()
    }
}
