//
//  DetailPresenter.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 17.07.2021.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol! { get set }
    var interactor: DetailInteractorProtocol! { get set }
    var router: DetailRouterProtocol! { get set }
    
    func didPressed(on beer: Beer)
}

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol!
    
    var interactor: DetailInteractorProtocol!
    
    var router: DetailRouterProtocol!
    
    var currentBeer: Beer?
    
    init(view: DetailViewProtocol) {
        self.view = view
    }
    
    func didPressed(on beer: Beer) {
        view.setDataForPresenting(from: beer)
    }
    
    
}
