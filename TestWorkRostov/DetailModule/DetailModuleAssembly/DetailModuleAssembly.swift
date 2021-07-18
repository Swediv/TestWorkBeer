//
//  DetailModuleAssembly.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 17.07.2021.
//

import UIKit

protocol DetailModuleAssemblyProtocol: AnyObject {
    static func configure(with viewController: DetailViewController)
}


class DetailModuleAssembly {
    static func configure(with viewController: DetailViewController) {
        let presenter = DetailPresenter(view: viewController)
        let interactor = DetailInteractor(presenter: presenter)
        let router = DetailRouter(presenter: presenter)
        
        viewController.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
    }
}
