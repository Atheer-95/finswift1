//
//  DatePickerTableViewCell.swift
//  FinSwift
//
//  Created by Atheer Othman on 27/11/1445 AH.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell {
    
    var financeYearLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .yearAndMonth
        return picker
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInterface(){
        backgroundColor = .systemGray5
        contentView.addSubview(financeYearLabel)
        contentView.addSubview(datePicker)
        NSLayoutConstraint.activate([
            financeYearLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            financeYearLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            
            datePicker.topAnchor.constraint(equalTo: financeYearLabel.bottomAnchor, constant: 8),
            datePicker.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            datePicker.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
