//
//  AlertFactory.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 18.07.2021.
//

import UIKit

protocol AlertFactoryProtocol: AnyObject {
    
}

class AlertFactory: AlertFactoryProtocol {
    static func makeWarningAlert(with warning: Warning) -> UIAlertController {
        let alertController = UIAlertController(title: "Warning!", message: warning.description, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        return alertController
    }
}
