//
//  SocialLinksView.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import UIKit

class SocialLinksView: GenericBaseView<SocialLinksViewData> {
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [title, socialMediaIcons])
        temp.axis = .vertical
        temp.distribution = .fill
        temp.alignment = .leading
        temp.spacing = 10
        return temp
    }()
    
    private lazy var title: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = Localizables.socialLinks.value
        temp.font = FontManager.robotoMedium(18).value
        temp.textColor = Colors.paleGray.value
        temp.textAlignment = .left
        temp.contentMode = .left
        return temp
    }()
    
    private lazy var socialMediaIcons: UIStackView = {
        let temp = UIStackView()
        temp.axis = .horizontal
        temp.distribution = .fill
        temp.alignment = .leading
        temp.spacing = 5
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addComponents()
        addSocialMediaIcons()
    }
    
    private func addComponents() {
        addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().offset(16)
        }
    }
    
    private func addSocialMediaIcons() {
        let icons: [UIImage] = [Images.facebook.value, Images.twitter.value, Images.tiktok.value, Images.instagram.value, Images.snapchat.value]
        
        for icon in icons {
            let imageView = UIImageView(image: icon)
            imageView.snp.makeConstraints { make in
                make.size.equalTo(24)
            }
            socialMediaIcons.addArrangedSubview(imageView)
        }
    }
}
