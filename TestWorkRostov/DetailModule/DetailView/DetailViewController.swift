//
//  DetailViewController.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 17.07.2021.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    
}

class DetailViewController: UIViewController, DetailViewProtocol {

    
        
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .blue
        let totalHeight = beerImageView.frame.height + beerName.frame.height + beerDescription.frame.height + beerFoodPairing.frame.height
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: view.bounds.height, height: totalHeight)
        
        return scrollView
    }()
    
    lazy var beerImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    lazy var beerName: UILabel = {
       let label = UILabel()
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var beerDescription: UILabel = {
       let label = UILabel()
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var beerFoodPairing: UILabel = {
       let label = UILabel()
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupUI()
        setConstraints()
    }
    
    private func setupUI() {
        scrollView.addSubview(beerImageView)
        scrollView.addSubview(beerName)
        scrollView.addSubview(beerDescription)
        scrollView.addSubview(beerFoodPairing)
        view.addSubview(scrollView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            beerName.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            beerName.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            beerName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            beerImageView.topAnchor.constraint(equalTo: beerName.bottomAnchor, constant: 5),
            beerImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            beerImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            beerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            beerDescription.topAnchor.constraint(equalTo: beerImageView.bottomAnchor, constant: 5),
            beerDescription.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            beerDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            beerFoodPairing.topAnchor.constraint(equalTo: beerDescription.bottomAnchor, constant: 5),
            beerFoodPairing.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            beerFoodPairing.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
