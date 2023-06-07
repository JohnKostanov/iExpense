//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Джон Костанов on 30/12/21.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
