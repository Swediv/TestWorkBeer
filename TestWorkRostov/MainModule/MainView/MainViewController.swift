//
//  MainViewController.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
    var presenter: MainPresenterProtocol! { get set }
}

class MainViewController: UIViewController, MainViewControllerProtocol {
    var presenter: MainPresenterProtocol!
    

    lazy var beersTableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BeerCell.self, forCellReuseIdentifier: BeerCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .yellow
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setConstraints()
    }
    
    private func setupUI() {
        view.addSubview(beersTableView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            beersTableView.topAnchor.constraint(equalTo: view.topAnchor),
            beersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            beersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            beersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
  
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeerCell.reuseIdentifier, for: indexPath) as! BeerCell
        cell.beerName.text = "beer"
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}
