//
//  CompanyFinanceStatment.swift
//  FinSwift
//
//  Created by Atheer Othman on 25/11/1445 AH.
//

import Foundation

// i don't need array i just need two object

struct CompanyFinanceStatment {
    var companyName: String
    var financeStatmentYear: Int
    var financeStatmentId: UUID
    // / Position Statement
    var totalAssets: Int
    var propertyRights: Int
    var currentAssets: Int
    var nonCurrentAssets: Int
    var currentLiabilities: Int
    var inventory: Int
    var cash: Int
    var longTermLoans: Int
    var shortTermLoans: Int
    var accountsReceivable: Int
    var payables: Int
    // Income Statement
    var sales: Int
    var operatingProfit: Int
    var grossProfit: Int
    var netProfit: Int
    var financingCosts: Int
    var netProfitBeforeInterestAndTaxes: Int
    var costOfSales: Int
}
