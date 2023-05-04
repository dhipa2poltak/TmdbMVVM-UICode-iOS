//
//  Coordinator.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import UIKit

public protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
