//
//  MainRouter.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import UIKit

protocol MainRouterProtocol {
    var presenter: MainPresenterProtocol! { get set }
    var view: MainViewController! { get }
    
    
    func presentDetailView(with beer: Beer)
    func presentWarning(withWarning warning: Warning)
}

class MainRouter: MainRouterProtocol {
    
    weak var view: MainViewController!
    var presenter: MainPresenterProtocol!
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func presentDetailView(with beer: Beer) {
        let detailVC = DetailViewController()
        DetailModuleAssembly.configure(with: detailVC)
        
        detailVC.presenter.didPressed(on: beer)
        view.navigationController?.pushViewController(detailVC, animated: false)
        
    }
    func presentWarning(withWarning warning: Warning) {
        let warningAlert = AlertFactory.makeWarningAlert(with: warning)
        DispatchQueue.main.async {
            self.view.present(warningAlert, animated: true, completion: nil)
        }
        
    }
    
}
