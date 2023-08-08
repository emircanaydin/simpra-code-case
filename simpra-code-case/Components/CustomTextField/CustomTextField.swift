//
//  TextFieldView.swift
//  Glare
//
//  Created by Emircan Aydın on 30.12.2021.
//

import UIKit
import SnapKit

class CustomTextField: GenericBaseView<CustomTextFieldData> {
    var textDidChangeWorkItem: DispatchWorkItem?
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.backgroundColor = .clear
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [textField])
        temp.axis = .vertical
        temp.distribution = .fill
        temp.alignment = .fill
        temp.spacing = 15
        return temp
    }()
    
    lazy var textField: UITextField = {
        let temp = UITextField()
        temp.clearButtonMode = .never
        temp.textColor = Colors.defaultGray.value
        temp.tintColor = Colors.defaultGray.value
        temp.borderStyle = .none
        return temp
    }()
    
    //MARK: - Override Methods
    override func addMajorFields() {
        super.addMajorFields()
        addUserInterfaceComponent()
    }
    
    override func setupViews() {
        super.setupViews()
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    //MARK: - Private Methods
    private func addUserInterfaceComponent() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    func addBottomLine() {
        DispatchQueue.main.async {
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0.0, y: self.textField.frame.height - 1, width: self.textField.frame.width, height: 1.0)
            bottomLine.backgroundColor = Colors.simpraOrange.value.cgColor
            self.textField.borderStyle = UITextField.BorderStyle.none
            self.textField.layer.addSublayer(bottomLine)
        }
    }
    
    override func didMoveToWindow() {
        addBottomLine()
    }
    
    @objc public func textFieldDidChange(_ textField: UITextField) {
        textDidChangeWorkItem?.cancel()
        
        guard let text = textField.text else {
            return
        }
        
        guard let data = returnData() else { return }
        guard let listener = data.textChangeListener else { return }
        
        let newTask = DispatchWorkItem {
            listener(text)
        }
        
        self.textDidChangeWorkItem = newTask
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: newTask)
    }
}
