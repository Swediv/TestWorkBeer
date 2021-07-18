//
//  BeerCell.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import UIKit

class BeerCell: UITableViewCell {

    private var task: URLSessionDataTask?
    
    var beerImageURL: URL? {
        didSet {
            setImage()
        }
    }
    
    lazy var cellView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    lazy var indicator: UIActivityIndicatorView = {
        
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .black
        indicator.hidesWhenStopped = true
        

        return indicator
    }()
    
    lazy var beerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 15
        imageView.addSubview(indicator)
        indicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
        return imageView
    }()
    
    lazy var beerName: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 26, weight: .medium)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        task?.cancel()
        beerName.text = ""
        beerImage.image = nil
    }
    func configure(with beer: Beer) {
        beerName.text = beer.name
        beerImage.image = nil
        self.beerImageURL = URL(string: beer.imageURL)
        
        
    }
    
    private func setupUI() {
        contentView.addSubview(cellView)
        cellView.addSubview(beerName)
        cellView.addSubview(beerImage)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            beerName.topAnchor.constraint(equalTo: cellView.topAnchor),
            beerName.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            beerName.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            
            beerImage.topAnchor.constraint(equalTo: beerName.bottomAnchor, constant: 15),
            beerImage.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
            beerImage.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -8),
            beerImage.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.8),
            
        ])
    }
    private func setImage() {
        if let url = beerImageURL {
            indicator.startAnimating()
             task = ImageService.getImage(from: url) { [weak self] image in
                self?.beerImage.image = image
                DispatchQueue.main.async {
                    self?.indicator.stopAnimating()
                }
            }
        }
    }
}
