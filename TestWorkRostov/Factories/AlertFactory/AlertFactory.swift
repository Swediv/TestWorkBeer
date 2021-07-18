//
//  AlertFactory.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 18.07.2021.
//

import UIKit

enum AlertsType {
    case warning(warning: Warning)
    case error(error: Error)
    case info(info: String)
}


protocol AlertFactoryProtocol: AnyObject {
    func getAlert(by type: AlertsType) -> UIViewController
}


class AlertFactory: AlertFactoryProtocol {
    
    func getAlert(by type: AlertsType) -> UIViewController {
        switch type {
        
        case let .warning(warning):
            return createWarningAlert(warning)
        case let .error(error):
            return createErrorAlert(error)
        case let .info(info):
            return createInfoAlert(info)
        }
    }
    
    private func createWarningAlert(_ warning: Warning) -> UIViewController {
        let alert = UIAlertController(title: "Warning!", message: warning.description, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        return alert
    }
    
    private func createErrorAlert(_ error: Error) -> UIViewController {
        let alert = UIAlertController(title: "Error!", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        return alert
    }
    
    private func createInfoAlert(_ info: String) -> UIViewController {
        let alert = UIAlertController(title: "Information", message: info, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        return alert
    }
}


