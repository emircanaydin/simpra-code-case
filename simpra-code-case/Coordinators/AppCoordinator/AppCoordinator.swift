//
//  AppCoordinator.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import UIKit
import RxSwift
import Swinject

class AppCoordinator: BaseCoordinator<AppViewModel> {
    
    private let disposeBag = DisposeBag()
    
    var window = UIWindow(frame: UIScreen.main.bounds)

    private lazy var commonApplicationLauncher: BooleanCompletionBlock = { [weak self] completed in
        if completed {
            //self?.launchApplication()
            self?.launchMainProcess()
        }
    }
    
    override func start() {
        window.makeKeyAndVisible()
        loadSplashScreen()
    }
    
    private func launchApplication() {
        launchMainProcess()
    }
    
    // MARK: - Main Screens Implementations -
    private func launchMainProcess() {
        removeChildCoordinators()
    }
    
    // MARK: - Splash Screen Implemententations -
    private func loadSplashScreen() {
        removeChildCoordinators()
        guard let coordinator = assemblerResolver.resolve(SplashCoordinator.self) else { return }
        start(coordinator: coordinator)
        
        coordinator.listenSplahCoordinatorFinishes(completion: commonApplicationLauncher).disposed(by: disposeBag)
        
        ViewControllerUtils.setRootViewController(window: window, viewController: coordinator.viewContoller, withAnimation: true)
    }
    
    private func registerTutorialObservers() {
        
    }
    
}
