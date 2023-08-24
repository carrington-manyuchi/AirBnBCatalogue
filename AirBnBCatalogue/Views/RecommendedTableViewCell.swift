//
//  RecommendedTableViewCell.swift
//  AirBnBCatalogue
//  Created by DA MAC M1 157 on 2023/08/22.
//

import UIKit

class RecommendedTableViewCell: UITableViewCell {
    
    public static let identifier = "RecommendedTableViewCell"
    
    private let backView: UIView = {
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

    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(systemName: "person")
        imageView.layer.masksToBounds = true
        return  imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.textColor = UIColor.label
        label.font = UIFont(name: "avenir-bold", size: 18)
        label.numberOfLines = 1
        return label
    }()
    
    private let subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Subtitle"
        label.font = UIFont(name: "avenir-medium", size: 25)
        label.textColor = UIColor.systemGray5
        label.numberOfLines = 1
        return label
    }()
        
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Price"
        label.font = UIFont(name: "avenir-medium", size: 15)
        label.textColor = UIColor.label
        label.numberOfLines = 1
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with image: UIImage) {
        myImageView.image = image
    }
    
    func setupUI() {
        self.contentView.addSubview(backView)
        self.contentView.addSubview(myImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(subTitle)
        self.contentView.addSubview(priceLabel)
        setupConstraints()
        
        
        
    }
    
    func setupConstraints() {
        
        let composeBackView = [
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ]
        
        let composeImage = [
            myImageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            myImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
            myImageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10),
            myImageView.widthAnchor.constraint(equalToConstant: 90),
            myImageView.heightAnchor.constraint(equalToConstant: 90)
        ]
        let composeTitleLabel = [
            titleLabel.topAnchor.constraint(equalTo: myImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10)
        ]
        
        let composeSubTitle = [
            subTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            subTitle.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 10),
            subTitle.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10)
        ]
        
        let composePriceLabel = [
            priceLabel.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 10),
            priceLabel.bottomAnchor.constraint(equalTo: myImageView.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10)
        ]
    
        NSLayoutConstraint.activate(composeImage)
        NSLayoutConstraint.activate(composeTitleLabel)
        NSLayoutConstraint.activate(composeSubTitle)
        NSLayoutConstraint.activate(composePriceLabel)
        NSLayoutConstraint.activate(composeBackView)
    }

}
