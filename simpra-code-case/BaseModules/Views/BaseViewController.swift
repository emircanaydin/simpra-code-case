//
//  BaseViewController.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import UIKit

class BaseViewController<T: BaseViewModelDelegate>: UIViewController {
    var viewTitle: String? { return nil }

    var viewModel: T!
    
    convenience init(viewModel: T) {
        self.init()
        self.viewModel = viewModel
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func prepareViewControllerConfigurations() {
        
    }
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let temp = UIActivityIndicatorView(style: .gray)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    func startIndicatingActivity() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.addSubview(self.activityIndicator)
            NSLayoutConstraint.activate([
                self.activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                self.activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            ])
            self.activityIndicator.startAnimating()
        }
        
    }
    
    func stopIndicatingActivity() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.removeFromSuperview()
            self.activityIndicator.stopAnimating()
        }
    }
    
}
