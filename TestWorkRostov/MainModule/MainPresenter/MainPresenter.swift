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
}

class MainPresenter: MainPresenterProtocol {

    weak var view: MainViewControllerProtocol!
    
    var interactor: MainInteractorProtocol! {
        didSet {
            interactor.getBeers()
        }
    }
    
    var router: MainRouterProtocol!
    
    var beers: [Beer] = [] {
        didSet {
            beersCount = beers.count
            view.updateData()
        }
    }
    
    var beersCount = 0 {
        didSet {
            view.updateData()
        }
    }

    init(view: MainViewControllerProtocol) {
        self.view = view
    }
    
    func loadBeers() {
        interactor.getBeers()
    }
    func interactorDidFetchedBeers(beers: [Beer]) {
        self.beers.append(contentsOf: beers)
        
    }
    func cellDidPressed(at index: Int) {
        router.presentDetailView(with: beers[index])
    }
    
}
