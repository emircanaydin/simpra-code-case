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
        static let buttonHeight: CGFloat = 56.0
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
        temp.textColor = Colors.defaultWhite.value
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
        temp.textField.isSecureTextEntry = true
        temp.textField.placeholder = Localizables.password.value
        return temp
    }()
    
    private lazy var loginButton: ActionButton = {
        let temp = ActionButton()
        return temp
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addComponents()
        configureLoginButton()
        configureUsernameField()
        listenLoginState()
    }
    
    private func addComponents() {
        self.view.addSubview(headerShadowView)
        headerShadowView.addSubview(headerArea)
        headerArea.addSubview(headerTitle)
        
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        
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
            make.horizontalEdges.equalToSuperview().inset(Const.horizontalPadding)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(Const.horizontalPadding)
            make.height.equalTo(Const.buttonHeight)
        }
    }
    
    private func listenLoginState() {
        viewModel.listenLoginState { state in
            switch state {
            case .success:
                self.viewModel.fireLoginProcessFinish()
            case .userNotFound:
                self.usernameTextField.error(message: Localizables.userNotFound.value)
            case .usernameBlank:
                self.usernameTextField.error(message: Localizables.usernameBlank.value)
            default:
                break
            }
        }
    }
    
    private func configureLoginButton() {
        let loginButtonData = ActionButtonData(text: Localizables.login.value)
        loginButtonData.setActionButtonListener(by: loginAction)
        loginButton.setData(data: loginButtonData)
    }
    
    private func configureUsernameField() {
        let usernameField = CustomTextFieldData(textChangeListener: usernameFieldChangeListener)
        usernameTextField.setData(data: usernameField)
    }
    
    private lazy var loginAction: VoidCompletionBlock = { [weak self] in
        guard let self = self else { return }
        self.viewModel.login()
    }
    
    private lazy var usernameFieldChangeListener: TextChangeBlock = { [weak self] text in
        guard let self = self, let username = text else { return }
        self.viewModel.username = username
    }
    
    private var headerHeight: CGFloat {
        UIScreen.main.bounds.height * (2/5)
    }
}
