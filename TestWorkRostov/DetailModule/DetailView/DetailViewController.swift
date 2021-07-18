//
//  DetailViewController.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 17.07.2021.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol! { get set }
    
    func setDataForPresenting(from beer: Beer) 
}

class DetailViewController: UIViewController, DetailViewProtocol {
    
    var presenter: DetailPresenterProtocol!
    
    lazy var descriptionStaticTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description:"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left

       return label
    }()
    lazy var staticTitleBestPairingWith: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Best pairing with:"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left

       return label
    
    }()
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let imageView = UIImageView(frame: view.frame)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
    
        imageView.image = #imageLiteral(resourceName: "beerBackground")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.alpha = 0.5
        
        
        return view
    }()
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: view.bounds.width, height: scrollViewContainer.frame.height)
        scrollView.contentInsetAdjustmentBehavior = .always
        
        
        return scrollView
    }()
    lazy var scrollViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
    
        
        return stackView
    }()
    lazy var beerImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var beerName: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
        
        return label
    }()
    
    lazy var beerDescription: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        return label
    }()
    
    lazy var beerFoodPairing: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
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
        
        scrollViewContainer.addSubview(beerImageView)
        scrollViewContainer.addSubview(beerName)
        scrollViewContainer.addSubview(beerDescription)
        scrollViewContainer.addSubview(beerFoodPairing)
        scrollViewContainer.addSubview(descriptionStaticTitle)
        scrollViewContainer.addSubview(staticTitleBestPairingWith)
        
        scrollView.addSubview(scrollViewContainer)
        backgroundView.addSubview(scrollView)
        view.addSubview(backgroundView)
        
        
        navigationItem.largeTitleDisplayMode = .never
        
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            beerName.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor),
            beerName.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor),
            beerName.bottomAnchor.constraint(equalTo: beerImageView.topAnchor, constant: -5),
            
            beerImageView.topAnchor.constraint(equalTo: beerName.bottomAnchor, constant: 5),
            beerImageView.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor, multiplier: 0.8),
            beerImageView.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
            beerImageView.heightAnchor.constraint(equalToConstant: 600),
            
            descriptionStaticTitle.topAnchor.constraint(equalTo: beerImageView.bottomAnchor, constant: 8),
            descriptionStaticTitle.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor),
            descriptionStaticTitle.bottomAnchor.constraint(equalTo: beerDescription.topAnchor),
            
            beerDescription.topAnchor.constraint(equalTo: descriptionStaticTitle.bottomAnchor,constant: 5),
            beerDescription.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            beerDescription.bottomAnchor.constraint(equalTo: staticTitleBestPairingWith.topAnchor, constant: -5),
            
            staticTitleBestPairingWith.topAnchor.constraint(equalTo: beerDescription.bottomAnchor, constant: 8),
            staticTitleBestPairingWith.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor),
            staticTitleBestPairingWith.bottomAnchor.constraint(equalTo: beerFoodPairing.topAnchor),
            
            beerFoodPairing.topAnchor.constraint(equalTo: staticTitleBestPairingWith.bottomAnchor, constant: 5),
            beerFoodPairing.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor),
            beerFoodPairing.bottomAnchor.constraint(equalTo: scrollViewContainer.bottomAnchor)
        ])
    }
    func setDataForPresenting(from beer: Beer) {
        
        beerName.text = beer.name
        beerDescription.text = beer.beerDescription
        ImageService.getImage(from: URL(string: beer.imageURL)!) { [weak self] image in
            DispatchQueue.main.async {
                self?.beerImageView.image = image
            }
        }
        beerFoodPairing.text = beer.foodPairing.joined(separator: "; \n")
    }

}

extension DetailViewController: UIScrollViewDelegate {
    
}
