//
//  MainInteractor.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import Foundation

protocol MainInteractorProtocol {
    var presenter: MainPresenterProtocol! { get set }
    
    func getBeers()
}

class MainInteractor: MainInteractorProtocol {
    var presenter: MainPresenterProtocol!
    private var currentTask: URLSessionDataTask?
    
    var currentPage = 5
    let countPerPage = "10"
    var isLoading = false
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getBeers() {
        guard !isLoading else {
            presenter.presentWarning(withWarning: .doubleRequest)
            return
            
        }
        
        isLoading = true
        currentTask?.cancel()
        currentTask = NetworkManager.request(.forLoading(page: "\(currentPage)", countPerPage: countPerPage)) { [weak self] result in
            self?.isLoading = false
            switch result {
            
            case .success(let data):
                let jsonData = ParsingService.decode([Beer].self, fromData: data)
                switch jsonData {
                
                case .success(let beers):
                    self?.currentPage += 1
                    self?.presenter.interactorDidFetchedBeers(beers: beers)
                    
                case .failure(let error):
                    print(error)
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
