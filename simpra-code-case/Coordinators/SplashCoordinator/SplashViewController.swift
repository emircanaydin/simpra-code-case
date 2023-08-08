//
//  SplashViewController.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import UIKit

class SplashViewController: BaseViewController<SplashScreenViewModel> {
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        viewModel.startSplashProcess()
    }
}
