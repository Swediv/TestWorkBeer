//
//  MainPresenter.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewControllerProtocol! { get set }
    var interactor: MainInteractorProtocol! { get set }
    var router: MainRouterProtocol! { get set }
}

class MainPresenter: MainPresenterProtocol {
    weak var view: MainViewControllerProtocol!
    
    var interactor: MainInteractorProtocol!
    
    var router: MainRouterProtocol!
    
    
}
