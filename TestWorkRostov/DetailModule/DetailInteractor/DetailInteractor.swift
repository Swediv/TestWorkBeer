//
//  DetailInteractor.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 17.07.2021.
//

import Foundation


protocol DetailInteractorProtocol: AnyObject {
    var presenter: DetailPresenterProtocol! { get set }
}


class DetailInteractor: DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol!
    
    init(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
    }
}
