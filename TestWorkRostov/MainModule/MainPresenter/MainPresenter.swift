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
    var beersCount: Int { get }
    var beers: [Beer] { get set }
    
    func loadBeers()
    func interactorDidFetchedBeers(beers: [Beer])
    func cellDidPressed(at index: Int)
    func presentWarning(withWarning warning: Warning)
}

class MainPresenter: MainPresenterProtocol {

    weak var view: MainViewControllerProtocol!
    
    var interactor: MainInteractorProtocol! {
        didSet {
            view.makeViewDarker()
            view.startAnimating()
            interactor.getBeers()
        }
    }
    
    var router: MainRouterProtocol!
    
    var beers: [Beer] = [] {
        didSet {
            beersCount = beers.count
            view.updateData()
            view.stopAnimating()
            view.returnViewToNormalState()
        }
    }
    
    var beersCount = 0 {
        didSet {
            view.updateData()
            view.stopAnimating()
            view.returnViewToNormalState()
        }
    }

    init(view: MainViewControllerProtocol) {
        self.view = view
    }
    
    func loadBeers() {
        view.makeViewDarker()
        view.startAnimating()
        interactor.getBeers()
    }
    func interactorDidFetchedBeers(beers: [Beer]) {
        self.beers.append(contentsOf: beers)
        
    }
    func cellDidPressed(at index: Int) {
        router.presentDetailView(with: beers[index])
    }
    func presentWarning(withWarning warning: Warning) {
        router.presentWarning(withWarning: warning)
    }
    
}
