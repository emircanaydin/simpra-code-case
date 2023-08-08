//
//  Coordinator.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import UIKit

protocol Coordinator: AnyObject {
   
   var navigationController: UINavigationController { get set }
   var childCoordinators: [Coordinator] { get set }
   var parentCoordinator: Coordinator? { get set }
   
   func start()
   func start(coordinator: Coordinator)
   func didFinish(coordinator: Coordinator)
   func removeChildCoordinators()
   
}
