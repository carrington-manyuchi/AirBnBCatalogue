//
//  RecommendedTableViewCell.swift
//  AirBnBCatalogue
//
//  Created by DA MAC M1 157 on 2023/08/22.
//

import UIKit

class RecommendedTableViewCell: UITableViewCell {
    
    public static let identifier = "RecommendedTableViewCell"

    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return  imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.textColor = UIColor.label
        label.font = UIFont(name: "avenir-bold", size: 25)
        label.numberOfLines = 1
        return label
    }()
    
    
    private let subTitle: UILabel = {
        let
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
