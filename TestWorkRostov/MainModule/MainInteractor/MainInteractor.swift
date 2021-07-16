//
//  MainInteractor.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import Foundation

protocol MainInteractorProtocol {
    var presenter: MainPresenterProtocol! { get set }
}

class MainInteractor: MainInteractorProtocol {
    var presenter: MainPresenterProtocol!
    
    
}
