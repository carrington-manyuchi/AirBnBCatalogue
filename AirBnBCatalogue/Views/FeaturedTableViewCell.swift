//
//  FeaturedTableViewCell.swift
//  AirBnBCatalogue
//
//  Created by DA MAC M1 157 on 2023/08/22.
//

import UIKit

class FeaturedTableViewCell: UITableViewCell {
    
    
    
    public static let identifier = "FeaturedTableViewCell"
    
    var topLocationsData: [LocationModel] = [LocationModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: - Properties
    
    public let collectionView: UICollectionView = {
        
        
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInsetAdjustmentBehavior = .automatic
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.register(TopLocationCollectionViewCell.self, forCellWithReuseIdentifier: TopLocationCollectionViewCell.identifier)
        
        //let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 25.0
        layout.minimumInteritemSpacing = 25.0
        
        return collectionView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViewss()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupViewss()

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewss() {
        collectionView.delegate = self
        collectionView.dataSource =  self
        self.addSubview(collectionView)
        collectionView.backgroundColor = .yellow
        composeConstraints()
    }
    
    func composeConstraints() {
        let composeCollectionViewConstraints = [
            collectionView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(composeCollectionViewConstraints)
    }
    
}

//MARK: - DELEGATES AND DATASOURCE

extension FeaturedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topLocationsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopLocationCollectionViewCell.identifier, for: indexPath) as? TopLocationCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let location = topLocationsData[indexPath.row]
        cell.imageView.image = location.locationImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.size.width
        return CGSize(width: screenWidth, height: 370)
    }
    
}
