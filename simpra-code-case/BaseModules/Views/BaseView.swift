//
//  BaseView.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import UIKit

public class BaseView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addMajorFields()
        setupViews()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        addMajorFields()
        setupViews()
    }
    
    func addMajorFields() {}
    func setupViews() {}
}
