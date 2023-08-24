//
//  TopLocationCollectionViewCell.swift
//  AirBnBCatalogue
//
//  Created by DA MAC M1 157 on 2023/08/24.
//

import UIKit

class TopLocationCollectionViewCell: UICollectionViewCell {
    
    
    //MARK: - Properties
    
    public static let identifier = "TopLocationCollectionViewCell"
    
    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "1bedapartment.jpg")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionViews()
    }
    
    
    
    
    //MARK: - setup Views
    
    
    func setupCollectionViews() {
        contentView.addSubview(mainView)
        contentView.addSubview(imageView)
        composeConstraints()
    }
    
    
    func composeConstraints() {
        let composeMainViewConstraints = [
            mainView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ]
        
        let composeImageViewConstraints = [
            imageView.topAnchor.constraint(equalTo: mainView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ]
        
        NSLayoutConstraint.activate(composeMainViewConstraints)
        NSLayoutConstraint.activate(composeImageViewConstraints)
    }
    
    
}
