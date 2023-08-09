//
//  FriendContentDisplayerView.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import UIKit

class FriendContentDisplayerView: GenericBaseView<FriendContentDisplayerViewData> {
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageContainerView, userInfoStackView])
        temp.axis = .horizontal
        temp.alignment = .top
        temp.distribution = .fill
        temp.spacing = 20
        temp.layer.cornerRadius = 16
        return temp
    }()
    
    private lazy var imageContainerView: UIView = {
        let temp = UIView()
        temp.layer.cornerRadius = 50
        temp.clipsToBounds = true
        temp.layer.borderWidth = 1
        temp.layer.borderColor = Colors.defaultGray.value.cgColor
        return temp
    }()
    
    private lazy var profileImage: CustomImageViewComponent = {
        let temp = CustomImageViewComponent()
        temp.layer.cornerRadius = 50
        return temp
    }()
    
    private lazy var userInfoStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [nameLabel, emailLabel, phoneLabel, addressLabel])
        temp.axis = .vertical
        temp.alignment = .top
        temp.distribution = .fill
        temp.spacing = 8
        return temp
    }()
    
    private lazy var nameLabel: UILabel = {
        let temp = UILabel()
        temp.text = " "
        temp.font = FontManager.robotoBold(16).value
        temp.textColor = Colors.defaultGray.value
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        temp.contentMode = .left
        temp.textAlignment = .left
        return temp
    }()
    
    private lazy var emailLabel: UILabel = {
        let temp = UILabel()
        temp.text = " "
        temp.font = FontManager.robotoRegular(14).value
        temp.textColor = Colors.defaultGray.value
        temp.contentMode = .left
        temp.textAlignment = .left
        return temp
    }()
    
    private lazy var phoneLabel: UILabel = {
        let temp = UILabel()
        temp.text = " "
        temp.font = FontManager.robotoRegular(14).value
        temp.textColor = Colors.defaultGray.value
        temp.contentMode = .left
        temp.textAlignment = .left
        return temp
    }()
    
    private lazy var addressLabel: UILabel = {
        let temp = UILabel()
        temp.text = " "
        temp.font = FontManager.robotoRegular(14).value
        temp.textColor = Colors.defaultGray.value
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        temp.contentMode = .left
        temp.textAlignment = .left
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(mainStackView)
        imageContainerView.addSubview(profileImage)
        
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        profileImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.size.equalTo(100)
        }
    }
    
    override func loadDataToView() {
        guard let data = returnData() else { return }
        profileImage.setData(componentData: data.imageData)
        let name = data.name
        let location = data.location
        nameLabel.text = "\(name.first) \(name.last)"
        emailLabel.text = data.email
        phoneLabel.text = data.phone
        addressLabel.text = "\(location.street.number) \(location.street.name) \(location.state) \(location.city)/\(location.country)"
    }
}
