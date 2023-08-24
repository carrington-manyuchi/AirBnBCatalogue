//
//  ViewController.swift
//  AirBnBCatalogue
//
//  Created by DA MAC M1 157 on 2023/08/22.
//

import UIKit

class HomeVC: UIViewController {
    
    lazy var featuredLocationData: [LocationModel] = {
        return LocationModel.featuredData
    }()
    
    lazy var recommendedLocationData: [LocationModel] = {
        return LocationModel.recommendData
    }()
    
    private let images: [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
        UIImage(named: "6")!,
        UIImage(named: "7")!,
        UIImage(named: "8")!
        
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecommendedTableViewCell.self, forCellReuseIdentifier: RecommendedTableViewCell.identifier)
        tableView.register(FeaturedTableViewCell.self, forCellReuseIdentifier:  FeaturedTableViewCell.identifier)
        tableView.allowsSelection = false
        //xtableView.rowHeight = CGFloat(396.0)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupUI()
    }
    
    func setupUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = "Places"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        setupConstraints()
    }
    
    
    func setupConstraints() {
        let composeTableView = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(composeTableView)
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return featuredLocationData.count
        }
        
        
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FeaturedTableViewCell.identifier, for: indexPath) as? FeaturedTableViewCell else {
                return UITableViewCell()
            }
            
            cell.topLocationsData = featuredLocationData
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedTableViewCell.identifier, for: indexPath) as? RecommendedTableViewCell else {
            fatalError("The tableView could not dequeue RecommendedTableViewCell in the view controller")
        }
        
        let image = self.images[indexPath.row]
        cell.configure(with: image)
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CGFloat(200.0)
        }
        
        return CGFloat(125.0)
    }
}
