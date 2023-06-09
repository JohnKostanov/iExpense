//
//  Expenses.swift
//  iExpense
//
//  Created by Джон Костанов on 30/12/21.
//

import SwiftUI

protocol ExpendableItems: ObservableObject {
    associatedtype Item: Expendable
    var items: [Item] { get set }
    
    func saveItems()
    func loadItems()
    func removeItems(at offsets: IndexSet)
    func addItem()
}

class Expenses: ExpendableItems {
    typealias Item = ExpenseItem
    
    @Published var items = [Item]()
    @Published var item: Item
    
    init() {
        item = Expenses.crearItem()
    }
    
    func addItem() {
        let item = ExpenseItem(name: item.name, type: item.type, amount: item.amount)
        items.insert(item, at: 0)
    }
    
    static func crearItem() -> Item {
        let item = ExpenseItem(name: "", type: "Personal", amount: 0.0)
        return item
    }
}

extension ExpendableItems {
    func saveItems() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
    func loadItems() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Item].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
    func removeItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
