//
//  BeerCell.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import UIKit

class BeerCell: UITableViewCell {

    lazy var cellView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 20

        return view
    }()
    
    lazy var beerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    lazy var beerName: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
    
    func configure(withBeer: Beer) {
        
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
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            beerName.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            beerName.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            beerName.trailingAnchor.constraint(equalTo: beerImage.leadingAnchor, constant: 10),
            
            beerImage.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            beerImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            beerImage.widthAnchor.constraint(equalToConstant: 70),
            beerImage.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}
