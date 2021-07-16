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
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        let router = MainRouter()
        
        viewController.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController
        
        interactor.presenter = presenter
        
        router.presenter = presenter
        
    }
    
    
}
