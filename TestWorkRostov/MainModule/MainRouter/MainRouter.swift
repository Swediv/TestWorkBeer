//
//  MainRouter.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import Foundation

protocol MainRouterProtocol {
    var presenter: MainPresenterProtocol! { get set }
}

class MainRouter: MainRouterProtocol {
    var presenter: MainPresenterProtocol!
    
    
}
