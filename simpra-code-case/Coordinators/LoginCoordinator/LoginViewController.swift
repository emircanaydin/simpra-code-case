//
//  LoginViewController.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController<LoginViewModel> {
    enum Const {
        static let horizontalPadding: CGFloat = 16.0
    }
    
    private lazy var headerShadowView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        temp.layer.cornerRadius = 10
        return temp
    }()
    
    private lazy var headerArea: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = Colors.paleOrange.value
        return temp
    }()
    
    private lazy var headerTitle: UILabel = {
        let temp = UILabel()
        temp.font = FontManager.robotoBoldItalic(50).value
        temp.textColor = Colors.defaultGray.value
        temp.text = Localizables.brandName.value
        return temp
    }()
    
    private lazy var usernameTextField: CustomTextField = {
        let temp = CustomTextField()
        temp.textField.keyboardType = .emailAddress
        temp.textField.autocapitalizationType = .none
        temp.textField.placeholder = Localizables.username.value
        return temp
    }()
    
    private lazy var passwordTextField: CustomTextField = {
        let temp = CustomTextField()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textField.isSecureTextEntry = true
        temp.textField.placeholder = Localizables.password.value
        return temp
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addComponents()
    }
    
    private func addComponents() {
        self.view.addSubview(headerShadowView)
        headerShadowView.addSubview(headerArea)
        headerArea.addSubview(headerTitle)
        
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
        
        headerShadowView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(headerHeight)
        }
        
        headerArea.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        headerTitle.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(headerShadowView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(Const.horizontalPadding)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().offset(Const.horizontalPadding)
        }
    }
    
    private var headerHeight: CGFloat {
        UIScreen.main.bounds.height * (2/5)
    }
}
