//
//  DefaultTableSectionHeader.swift
//  FinSwift
//
//  Created by Atheer Othman on 27/11/1445 AH.
//

import UIKit

class DefaultTableSectionHeader: UIView {
    
    private(set) var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()

    convenience init(title: String) {
        self.init()
        backgroundColor = .systemGray5
        titleLabel.text = title
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18)
        ])
    }
}
