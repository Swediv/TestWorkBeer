//
//  MainAssembly.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import Foundation

protocol MainAssemblyProtocol {
    static func configure(with viewController: MainViewController)
}

class MainAssembly: MainAssemblyProtocol {
    static func configure(with viewController: MainViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(presenter: presenter)
        
        viewController.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        
        router.view = viewController
    }
}
