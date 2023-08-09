//
//  ActionButton.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import UIKit

class ActionButton: GenericBaseView<ActionButtonData> {
    private lazy var shadowContainer: UIView = {
        let temp = UIView()
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        temp.layer.cornerRadius = 10
        return temp
    }()
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.layer.cornerRadius = 16
        temp.clipsToBounds = true
        return temp
    }()
    
    private lazy var infoTitle: UILabel = {
        let temp = UILabel()
        temp.text = " "
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.font = FontManager.robotoBold(16).value
        temp.textColor = Colors.defaultWhite.value
        return temp
    }()
    
    // MARK: - Override Methods
    override func addMajorFields() {
        super.addMajorFields()
        addContainerView()
        setupBackground()
    }

    override func setupViews() {
        super.setupViews()
        addTapGesture()
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        
        infoTitle.text = data.text.uppercased()
    }
    
    // MARK: - Private Methods
    private func addContainerView() {
        addSubview(shadowContainer)
        shadowContainer.addSubview(containerView)
        containerView.addSubview(infoTitle)
        
        shadowContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        infoTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func setupBackground() {
        DispatchQueue.main.async {
            let gradient = CAGradientLayer()
            
            gradient.frame = self.containerView.bounds
            gradient.colors = [Colors.simpraOrange.value.cgColor, Colors.paleOrange.value.cgColor]
            self.containerView.layer.insertSublayer(gradient, at: 0)
        }
    }
    
    private func pressedButtonAction() {
        guard let data = returnData() else { return }
        data.actionButtonListener?()
    }
}

// MARK: - UIGestureRecognizerDelegate
extension ActionButton: UIGestureRecognizerDelegate {
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: .buttonTappedSelector)
        tap.delegate = self
        addGestureRecognizer(tap)
    }
    
    @objc fileprivate func buttonTapped(_ sender: UITapGestureRecognizer) {
        isUserInteractionEnabled = false
        startTappedAnimation { finish in
            if finish {
                self.isUserInteractionEnabled = true
                self.pressedButtonAction()
            }
        }
    }
}

fileprivate extension Selector {
    static let buttonTappedSelector = #selector(ActionButton.buttonTapped)
}
