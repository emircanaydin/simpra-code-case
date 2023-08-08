//
//  LoginViewController.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import UIKit

class LoginViewController: BaseViewController<LoginViewModel> {
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [logoImageView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.distribution = .fill
        temp.alignment = .fill
        temp.spacing = 8
        return temp
    }()
    
    private lazy var logoImageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.image = Images.logo.value
        return temp
    }()
    
    private lazy var emailTextField: CustomTextField = {
        let temp = CustomTextField()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textField.keyboardType = .emailAddress
        return temp
    }()
    
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addComponents()
    }
    
    private func addComponents() {
        self.view.addViewFitAllEdges(view: mainStackView)
        
        NSLayoutConstraint.activate([
            
        ])
    }
}
