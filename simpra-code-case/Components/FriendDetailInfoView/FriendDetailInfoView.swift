//
//  FriendDetailInfoView.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import UIKit

class FriendDetailInfoView: GenericBaseView<FriendDetailInfoViewData> {
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [nameTitle, friendNotesTitle, friendNotes])
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 5
        temp.setCustomSpacing(20, after: nameTitle)
        return temp
    }()
    
    private lazy var nameTitle: UILabel = {
        let temp = UILabel()
        temp.text = " "
        temp.font = FontManager.robotoBold(26).value
        temp.textColor = Colors.defaultGray.value
        temp.textAlignment = .left
        temp.contentMode = .left
        return temp
    }()
    
    private lazy var friendNotesTitle: UILabel = {
        let temp = UILabel()
        temp.text = Localizables.friendsNote.value
        temp.font = FontManager.robotoMedium(18).value
        temp.textColor = Colors.paleGray.value
        temp.textAlignment = .left
        temp.contentMode = .left
        return temp
    }()
    
    private lazy var friendNotes: UILabel = {
        let temp = UILabel()
        temp.text = " "
        temp.font = FontManager.robotoRegular(16).value
        temp.textColor = Colors.defaultGray.value
        temp.textAlignment = .left
        temp.contentMode = .left
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func loadDataToView() {
        guard let data = returnData() else { return }
        self.nameTitle.text = data.name
        /// I couldn't figure out what to fill on the detail page. That's why I decided to fill it with this text :/
        friendNotes.text = "Hello, my name is \(data.name). My email address is \(data.email), you can reach me via email anytime. I regularly check and respond to my emails. If you want to hear my voice, my number is here: \(data.phone). You can call anytime, we can even have video chats x.O.x. You might even want to visit me. Here's my home address, \(data.address). You can come anytime. We can gossip together, hahaha .d.d. Make sure to call me when you're coming, I'd like to prepare something for you. If the weather is sunny, we can have a drink by the pool in my garden. If it's cloudy, we can sit by the fireplace and have coffee together. You can even stay overnight. My door is always open to you. Let's stay in touch, my dear friend. I love you."
    }
}


class FriendDetailInfoViewCell: GenericCollectionViewCell<FriendDetailInfoViewData, FriendDetailInfoView> {
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        var targetSize = targetSize
        targetSize.height = CGFloat.greatestFiniteMagnitude
        
        let size = super.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        return size
    }
}
