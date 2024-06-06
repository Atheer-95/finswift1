//
//  FinancialRatiosTableViewCell.swift
//  FinSwift
//
//  Created by Atheer Othman on 26/11/1445 AH.
//

import UIKit

class BaiscFinancialRatiosTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel = {
       let l = UILabel()
        l.font = .systemFont(ofSize: 14)
        return l
    }()
    
    var nameTextFeild: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 14)
        tf.borderStyle = .roundedRect
        tf.autocorrectionType = .no
        return tf
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInterface()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupInterface(){
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameTextFeild)
        backgroundColor = .systemGray5
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextFeild.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            
            
            nameTextFeild.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            nameTextFeild.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            nameTextFeild.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            nameTextFeild.heightAnchor.constraint(equalToConstant: 45)            
        ])
    }
}

