//
//  MainViewController.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
    var presenter: MainPresenterProtocol! { get set }
    
    func updateData()
    func startAnimating()
    func stopAnimating()
    func makeViewDarker()
    func returnViewToNormalState()
}

class MainViewController: UIViewController, MainViewControllerProtocol {
    var presenter: MainPresenterProtocol!
    
    lazy var countPerPageControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        control.selectedSegmentTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        control.setTitleTextAttributes([.font : UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.white],
                                       for: .normal)
        control.setTitleTextAttributes([.font : UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.black],
                                       for: .selected)
        control.insertSegment(withTitle: "10", at: 0, animated: false)
        control.insertSegment(withTitle: "20", at: 1, animated: false)
        control.insertSegment(withTitle: "30", at: 2, animated: false)
        control.insertSegment(withTitle: "40", at: 3, animated: false)
        control.insertSegment(withTitle: "50", at: 4, animated: false)
        control.addTarget(self, action: #selector(changeCountPerPage), for: .valueChanged)
        
        return control
    }()
    lazy var loadingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Loading..."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        
        return label
    }()
    lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .white
        indicator.hidesWhenStopped = true
        indicator.addSubview(loadingLabel)
        loadingLabel.topAnchor.constraint(equalTo: indicator.bottomAnchor).isActive = true
        loadingLabel.centerXAnchor.constraint(equalTo: indicator.centerXAnchor).isActive = true
        
        return indicator
    }()
    lazy var beersTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BeerCell.self, forCellReuseIdentifier: BeerCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .gray
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
        view.addSubview(indicator)
        view.addSubview(countPerPageControl)
        
        navigationItem.title = "Beers"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            beersTableView.topAnchor.constraint(equalTo: countPerPageControl.bottomAnchor),
            beersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            beersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            beersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            countPerPageControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            countPerPageControl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 6),
            countPerPageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countPerPageControl.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    func updateData() {
        DispatchQueue.main.async {
            self.beersTableView.reloadData()
        }
        
    }
    
    func startAnimating() {
        DispatchQueue.main.async {
            self.indicator.startAnimating()
        }
    }
    
    func stopAnimating() {
        DispatchQueue.main.async {
            self.indicator.stopAnimating()
        }
    }
    
    @objc
    private func changeCountPerPage(_ sender: UISegmentedControl) {
        beersTableView.setContentOffset(.zero, animated: true)
        guard let value = sender.titleForSegment(at: sender.selectedSegmentIndex) else { return }
        presenter.valueCountPerPageDidChange(to: value)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.beersCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeerCell.reuseIdentifier, for: indexPath) as! BeerCell
        let beer = presenter.beers[indexPath.row]
        cell.configure(with: beer)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500.0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.isReachedBottom(withTolerance: 60) {
            presenter.loadBeers()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.cellDidPressed(at: indexPath.row)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            if scrollView.isReachedBottom(withTolerance: 60) {
                presenter.loadBeers()
            }
        }
    }
    
    func makeViewDarker() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.view.alpha = 0.7
            }
        }
    }
    
    func returnViewToNormalState() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.view.alpha = 1
            }  
        }
    }
}
