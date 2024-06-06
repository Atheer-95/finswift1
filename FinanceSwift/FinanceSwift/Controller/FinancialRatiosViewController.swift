//
//  ViewController.swift
//  FinanceSwift
//
//  Created by Atheer Othman on 29/11/1445 AH.
//

import UIKit

class FinancialRatiosViewController: UIViewController {
    
    let baiscFinancialRatiosTableViewCellIdentifier = "BaiscFinancialRatiosTableViewCellIIdentifier"
    let datePickerTableViewCellIdentifier = "DatePickerTableViewCellIdentifier"
    var companyFinanceStatment = CompanyFinanceStatment(companyName: "",
                                                        financeStatmentYear: 0,
                                                        financeStatmentId: UUID(),
                                                        totalAssets: 0,
                                                        propertyRights: 0,
                                                        currentAssets: 0,
                                                        nonCurrentAssets: 0,
                                                        currentLiabilities: 0,
                                                        inventory: 0,
                                                        cash: 0,
                                                        longTermLoans: 0,
                                                        shortTermLoans: 0,
                                                        accountsReceivable: 0,
                                                        payables: 0,
                                                        sales: 0,
                                                        operatingProfit: 0,
                                                        grossProfit: 0,
                                                        netProfit: 0,
                                                        financingCosts: 0,
                                                        netProfitBeforeInterestAndTaxes: 0,
                                                        costOfSales: 0)
    lazy var tableView:  UITableView = {
        let tb = UITableView()
        return tb
    }()
    
    lazy var footerButton: UIButton = {
        let b = UIButton()
        b.layer.cornerRadius = 6
        b.layer.masksToBounds = true
        b.backgroundColor = .blue
        b.titleLabel?.textColor = .white
        b.setTitle("Next", for: .normal)
        return b
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupInterface()
        tableView.register(BaiscFinancialRatiosTableViewCell.self,
                           forCellReuseIdentifier: baiscFinancialRatiosTableViewCellIdentifier)
        tableView.register(DatePickerTableViewCell.self,
                           forCellReuseIdentifier: datePickerTableViewCellIdentifier)
        
    }
    
    func setupInterface(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "FinSwift"
        view.backgroundColor = .systemGray5
        view.addSubview(tableView)
        view.addSubview(footerButton)
        
        tableView.backgroundColor = .systemGray5
        tableView.translatesAutoresizingMaskIntoConstraints = false
        footerButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo:  view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo:  view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: footerButton.topAnchor),
//            footerButton.topAnchor.constraint(equalTo: tableView.bottomAnchor,constant: 8),
            footerButton.heightAnchor.constraint(equalToConstant: 45),
            footerButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            footerButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            footerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -18)
        ])
    }
    
}

// MARK: - TableView Delegate & DataSource
extension FinancialRatiosViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Section.allCases[section].children.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = Section.allCases[indexPath.section]
        let item = section.children[indexPath.row]
        
        switch section {
            
        case .companyName, .FromFinancialPositionStatement, .FromIncomeStatement:
            let cell = tableView.dequeueReusableCell(withIdentifier: baiscFinancialRatiosTableViewCellIdentifier, for: indexPath) as! BaiscFinancialRatiosTableViewCell
            cell.nameLabel.text = item.title
            cell.nameTextFeild.placeholder = item.title
            cell.nameTextFeild.tag = indexPath.section * 100 + indexPath.row // Unique tag for each text field
            return cell
        case .financeYear:
            let cell = tableView.dequeueReusableCell(withIdentifier: datePickerTableViewCellIdentifier, for: indexPath) as! DatePickerTableViewCell
            cell.financeYearLabel.text = item.title
            //            cell.nameTextFeild.placeholder = item.title
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return DefaultTableSectionHeader(title: Section.allCases[section].title)
    }
    
    // FIXME: add a button as section Footer ?
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        switch Section.allCases[section] {
//
//        case .companyName, .FromFinancialPositionStatement, .financeYear:
//            return nil
//        case .FromIncomeStatement:
//            return DefaultTableSectionFooter(title: "Next")
//        }
//    }
    
}
// MARK: - TextField Delelgate
extension FinancialRatiosViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
              
              let tag = textField.tag
              let section = tag / 100
              let row = tag % 100
              
              let sectionType = Section.allCases[section]
              let itemType = sectionType.children[row]
              
              if let text = textField.text, !text.isEmpty {
                  switch itemType {
                  case .companyName:
                      companyFinanceStatment.companyName = text
                  case .financeYear:
                      if let year = Int(text) {
                          companyFinanceStatment.financeStatmentYear = year
                      }
                  case .totalAssets:
                      if let value = Int(text) {
                          companyFinanceStatment.totalAssets = value
                      }
                  case .propertyRights:
                      if let value = Int(text) {
                          companyFinanceStatment.propertyRights = value
                      }
                  case .currentAssets:
                      if let value = Int(text) {
                          companyFinanceStatment.currentAssets = value
                      }
                  case .nonCurrentAssets:
                      if let value = Int(text) {
                          companyFinanceStatment.nonCurrentAssets = value
                      }
                  case .currentLiabilities:
                      if let value = Int(text) {
                          companyFinanceStatment.currentLiabilities = value
                      }
                  case .inventory:
                      if let value = Int(text) {
                          companyFinanceStatment.inventory = value
                      }
                  case .cash:
                      if let value = Int(text) {
                          companyFinanceStatment.cash = value
                      }
                  case .longTermLoans:
                      if let value = Int(text) {
                          companyFinanceStatment.longTermLoans = value
                      }
                  case .shortTermLoans:
                      if let value = Int(text) {
                          companyFinanceStatment.shortTermLoans = value
                      }
                  case .accountsReceivable:
                      if let value = Int(text) {
                          companyFinanceStatment.accountsReceivable = value
                      }
                  case .payables:
                      if let value = Int(text) {
                          companyFinanceStatment.payables = value
                      }
                  case .sales:
                      if let value = Int(text) {
                          companyFinanceStatment.sales = value
                      }
                  case .operatingProfit:
                      if let value = Int(text) {
                          companyFinanceStatment.operatingProfit = value
                      }
                  case .grossProfit:
                      if let value = Int(text) {
                          companyFinanceStatment.grossProfit = value
                      }
                  case .netProfit:
                      if let value = Int(text) {
                          companyFinanceStatment.netProfit = value
                      }
                  case .financingCosts:
                      if let value = Int(text) {
                          companyFinanceStatment.financingCosts = value
                      }
                  case .netProfitBeforeInterestAndTaxes:
                      if let value = Int(text) {
                          companyFinanceStatment.netProfitBeforeInterestAndTaxes = value
                      }
                  case .costOfSales:
                      if let value = Int(text) {
                          companyFinanceStatment.costOfSales = value
                      }
                  }
              }
              print(companyFinanceStatment)
              return true
    }
}

// MARK: - Section

private enum Section: CaseIterable {
    case companyName,
         financeYear,
         FromFinancialPositionStatement,
         FromIncomeStatement
    
    var title: String {
        switch self {
        case .companyName: return "Company"
        case .financeYear: return "Finance Year"
        case .FromFinancialPositionStatement: return "Financial Position Statement"
        case .FromIncomeStatement: return "Income Statement"
        }
    }
    
    var children: [StatmentItem] {
        switch self {
            
        case .companyName:
            return [.companyName]
            
        case .financeYear:
            return [.financeYear]
            
        case .FromFinancialPositionStatement:
            return [ .totalAssets,
                     .propertyRights,
                     .currentAssets,
                     .nonCurrentAssets,
                     .currentLiabilities,
                     .inventory,
                     .cash,
                     .longTermLoans,
                     .shortTermLoans,
                     .accountsReceivable,
                     .payables]
            
        case .FromIncomeStatement:
            return [ .sales,
                     .operatingProfit,
                     .grossProfit,
                     .netProfit,
                     .financingCosts,
                     .netProfitBeforeInterestAndTaxes,
                     .costOfSales]
        }
    }
    
    fileprivate enum StatmentItem: Identifiable{
        case companyName,
             financeYear,
             // Position Statement
             totalAssets,
             propertyRights,
             currentAssets,
             nonCurrentAssets,
             currentLiabilities,
             inventory,
             cash,
             longTermLoans,
             shortTermLoans,
             accountsReceivable,
             payables,
             // Income Statment
             sales,
             operatingProfit,
             grossProfit,
             netProfit,
             financingCosts,
             netProfitBeforeInterestAndTaxes,
             costOfSales
        
        var id: String { String(describing: self) }
        
        var title: String {
            switch self {
                // Position Statement
            case .companyName: return "Company Name"
            case .financeYear: return "Year"
            case .totalAssets: return "Total Assets (assets)"
            case .propertyRights:  return "Property Rights"
            case .currentAssets: return "Current Assets"
            case .nonCurrentAssets: return "Non-Current Assets"
            case .currentLiabilities: return "Current Liabilities"
            case .inventory: return "Inventory"
            case .cash: return "Cash"
            case .longTermLoans: return "Long Term Loans"
            case .shortTermLoans: return "Short Term Loans"
            case .accountsReceivable: return "Accounts Receivable"
            case .payables: return "Payables"
                // Income Statement
            case .sales: return "Sales (revenue)"
            case .operatingProfit: return "Operating Profit"
            case .grossProfit: return "Gross Profit"
            case .netProfit: return "Net Profit"
            case .financingCosts: return "Financing Costs"
            case .netProfitBeforeInterestAndTaxes: return "Net Profit Before Interest and Taxes"
            case .costOfSales: return "Cost of Sales (purchases)"
            }
        }
        //        var subTitle: String? { nil }
        //        var imagePath: String { }
        //        var accessory: CustomAccessoryType? { }
    }
}
