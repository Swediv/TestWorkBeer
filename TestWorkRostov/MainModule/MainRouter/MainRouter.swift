//
//  MainRouter.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    var presenter: MainPresenterProtocol! { get set }
    var view: MainViewController! { get set }
    var alertFactory: AlertFactoryProtocol! { get set }
    
    func presentDetailView(with beer: Beer)
    func presentWarning(_ warning: Warning)
    func presentError(_ error: Error)
    func presentInfo(_ info: String)
}

class MainRouter: MainRouterProtocol {
    var alertFactory: AlertFactoryProtocol!
    var presenter: MainPresenterProtocol!
    weak var view: MainViewController! {
        didSet {
            presentInfo("Please indicate the number of items shown at the top of the table. Default is 10")
        }
    }
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func presentDetailView(with beer: Beer) {
        let detailVC = DetailViewController()
        DetailModuleAssembly.configure(with: detailVC)
        
        detailVC.presenter.didPressed(on: beer)
        view.navigationController?.pushViewController(detailVC, animated: false)
        
    }
    
    func presentWarning(_ warning: Warning) {
        DispatchQueue.main.async {
            let warningAlert = self.alertFactory.getAlert(by: .warning(warning: warning))
            self.view.present(warningAlert, animated: true, completion: nil)
        } 
    }
    
    func presentError(_ error: Error) {
        DispatchQueue.main.async {
            let errorAlert = self.alertFactory.getAlert(by: .error(error: error))
            self.view.present(errorAlert, animated: true, completion: nil)
        }
    }
    
    func presentInfo(_ info: String) {
        DispatchQueue.main.async {
            let infoAlert = self.alertFactory.getAlert(by: .info(info: info))
            self.view.present(infoAlert, animated: true, completion: nil)
        }
    }
}
