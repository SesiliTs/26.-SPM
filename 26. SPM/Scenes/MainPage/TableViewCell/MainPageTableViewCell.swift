//
//  TableViewCell.swift
//  26. SPM
//
//  Created by Sesili Tsikaridze on 19.11.23.
//

import UIKit

final class MainPageTableViewCell: UITableViewCell {

    private var factsLabel = {
        let factsLabel = UILabel()
        factsLabel.font = .systemFont(ofSize: 16)
        factsLabel.textColor = .darkGray
        factsLabel.lineBreakMode = .byWordWrapping
        factsLabel.numberOfLines = 0
        factsLabel.translatesAutoresizingMaskIntoConstraints = false
        return factsLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(factsLabel)
        
        NSLayoutConstraint.activate([
            factsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            factsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            factsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            factsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        factsLabel.text = text
    }
}
