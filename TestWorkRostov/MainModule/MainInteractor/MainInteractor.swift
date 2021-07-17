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
    
    var currentPage = 1
    let countPerPage = "10"
    var isLoading = false
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getBeers() {
        isLoading = true
        currentTask?.cancel()
        currentTask = NetworkManager.request(.forLoading(page: "\(currentPage)", countPerPage: countPerPage)) { [weak self] result in
            self?.isLoading = false
            switch result {
            
            case .success(let data):
                let jsonData = ParsingService.decode([Beer].self, fromData: data)
                switch jsonData {
                
                case .success(let beers):
                    print("ParsingService: Decoded models count:",beers.count)
                    print("ParsingService: Decoded first model name:",beers[0].name)
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
