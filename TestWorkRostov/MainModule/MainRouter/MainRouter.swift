//
//  MainRouter.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import UIKit

protocol MainRouterProtocol {
    var presenter: MainPresenterProtocol! { get set }
    
    func presentDetailView(with beer: Beer)
}

class MainRouter: MainRouterProtocol {
    var presenter: MainPresenterProtocol!
    var view: MainViewControllerProtocol!
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func presentDetailView(with beer: Beer) {
        let vc = DetailViewController()
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.application(<#T##application: UIApplication##UIApplication#>, didFinishLaunchingWithOptions: <#T##[UIApplication.LaunchOptionsKey : Any]?#>)
        
    }
    
}
