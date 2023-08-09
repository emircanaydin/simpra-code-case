//
//  LoadingCell.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import UIKit

class LoadingCellView: BaseCollectionViewCell {
    var activityIndicator: UIActivityIndicatorView!
    
    override func setupView() {
        super.setupView()
        prepareViewCell()
    }
    
    private func prepareViewCell() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .gray
        indicator.hidesWhenStopped = true
        
        contentView.addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            indicator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            indicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        
        indicator.startAnimating()
    }
}
