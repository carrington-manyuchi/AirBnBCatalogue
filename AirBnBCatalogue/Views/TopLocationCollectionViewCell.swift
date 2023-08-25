//
//  TopLocationCollectionViewCell.swift
//  AirBnBCatalogue
//
//  Created by DA MAC M1 157 on 2023/08/24.
//

import UIKit

class TopLocationCollectionViewCell: UICollectionViewCell {
    
    
    //MARK: - Properties
    
    static let identifier = "TopLocationCollectionViewCell"
    
    
    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.shadowOpacity = 0.7
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        view.layer.shadowOffset = CGSize(width: -3, height: 7)
        view.layer.shadowRadius = 5
        
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.backgroundColor = UIColor.systemCyan.cgColor
        view.layer.borderWidth = 2
        return view
    }()

    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionViews()
    }
    
    public func configure(with pic: UIImage) {
        self.imageView.image = pic
        self.setupCollectionViews()
    }
        
    //MARK: - setup Views

    func setupCollectionViews() {
        self.backgroundColor = .brown
        self.addSubview(mainView)
        self.addSubview(imageView)
        composeConstraints()
    }
    
    
    func composeConstraints() {
        let composeMainViewConstraints = [
            mainView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ]
        
        let composeImageViewConstraints = [
            imageView.topAnchor.constraint(equalTo: mainView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            //imageView.heightAnchor.constraint(equalToConstant: 250)
        ]
        
        NSLayoutConstraint.activate(composeMainViewConstraints)
        NSLayoutConstraint.activate(composeImageViewConstraints)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
    
}
