//
//  DefaultTableSectionFooter.swift
//  FinSwift
//
//  Created by Atheer Othman on 27/11/1445 AH.
//

import UIKit

class DefaultTableSectionFooter: UIView {

    private(set) var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        return button
    }()

    convenience init(title: String) {
        self.init()
        self.button.setTitle(title, for: .normal)
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            button.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            button.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
