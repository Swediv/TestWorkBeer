//
//  DetailRouter.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 17.07.2021.
//

import Foundation


protocol DetailRouterProtocol: AnyObject {
    var presenter: DetailPresenterProtocol! { get set }
}

class DetailRouter: DetailRouterProtocol {
    var presenter: DetailPresenterProtocol!
    
    init(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
    }
}
