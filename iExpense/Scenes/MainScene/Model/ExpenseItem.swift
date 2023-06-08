//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Джон Костанов on 30/12/21.
//

import Foundation

protocol Expendable: Identifiable, Codable, Equatable {
    var name: String { get }
    var type: String { get }
    var amount: Double { get }
}

struct ExpenseItem: Expendable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
    var types = ["Business", "Personal"]
}
