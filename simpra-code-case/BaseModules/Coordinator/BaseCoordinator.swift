//
//  BaseCoordinator.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import UIKit
import Swinject

typealias OnDismissed = () -> Void

class BaseCoordinator<T: BaseViewModelDelegate>: NSObject, Coordinator {
    let viewModel: T
    
    init(viewModel: T) {
        self.viewModel = viewModel
    }
    
    var assemblerResolver = Assembler.sharedAssembler.resolver
    
    var navigationController = UINavigationController()
    var viewContoller = UIViewController()
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    func start() {
        fatalError("Start method should be implemented.")
    }
    
    func start(coordinator: Coordinator) {
        // binary search, tree etc ???
        self.childCoordinators += [coordinator]
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    func removeChildCoordinators() {
        self.childCoordinators.forEach { $0.removeChildCoordinators() }
        self.childCoordinators.removeAll()
    }
    
    func didFinish(coordinator: Coordinator) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.childCoordinators.remove(at: index)
        }
    }
    
    func didFinish(coordinator: Coordinator, completion: OnDismissed) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.childCoordinators.remove(at: index)
            completion()
        }
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
